-- init.lua
-- 
-- Written by Grant Goodyear, stealing liberally from Aron Griffis

-- Aron's functions, including a table bug fix
--
-- lua 5.1 is buggy for the specific case of table with nils past the first
-- position, for example:
--
--   #{1,2,3} = 3
--   #{nil,2,3} = 3
--   #{1,nil,3} = 1 -- BUG! returns 3 in lua 5.4 and probably others
-- 
-- This bug affects unpack() which relies on the table to know its length. So we
-- replace with our own implementation that doesn't depend on the table knowing
-- its length.
local function unpork(t, n, ...)
  if n == 0 then
    return ...
  end
  return unpork(t, n - 1, t[n], ...)
end

local function test_unpork()
  local function f(...)
    return select('#', ...)
  end
  assert(f(unpack({1, nil, 3})) == 1)
  assert(f(unpork({1, nil, 3}, 3)) == 3)
  assert(f(unpork({1, nil, nil}, 3)) == 3)
end
test_unpork()

-- Given a function and arity, return a curried function.
local function curry(fn, arity)
  if not arity then
    arity = debug.getinfo(fn, 'u').nparams
  end
  return function(...)
    local nargs = select('#', ...)
    if nargs >= arity then
      return fn(...)
    end
    local args = {...}
    local fn2 = function(...) 
      -- can't do fn(unpork(), ...) because only the first element of the list
      -- returned by unpork will be used in that case. So we have to assemble
      -- the full list of args before calling unpork.
      for i = 1, select('#', ...) do
        args[nargs + i] = select(i, ...)
      end
      return fn(unpork(args, nargs + select('#', ...)))
    end
    return curry(fn2, arity - nargs)
  end
end

local function test_curry()
  local function f(z, y, x, v, w)
    return z, y, x, v, w
  end
  local a, b, c, d, e = curry(f)('a', 'b')('c')()('d', 'e')
  assert(a == 'a')
  assert(b == 'b')
  assert(c == 'c')
  assert(d == 'd')
  assert(e == 'e')
end
test_curry()

-- map(fn, tbl) Map a table through a function, returning a new table. Does not
-- modify the original table. Curried for use with compose()
local map = curry(function(fn, t)
  local r = {}
  for k, v in pairs(t) do
    r[k] = fn(v, k, t)
  end
  return r
end)

-- filter(fn, tbl) Filter a table through a function, returning a new table.
-- Does not modify the original table. Curried for use with compose()
local filter = curry(function(fn, t)
  local r = {}
  for k, v in pairs(t) do
    if fn(v, k, t) then
      r[k] = v
    end
  end
  return r
end)

local function compose(...)
  local fns = {...}
  return function(x)
    for _, fn in ipairs(fns) do
      x = fn(x)
    end
    return x
  end
end

local function merge(...)
  return vim.tbl_extend('force', ...)
end

local function keymap(mode, lhs, rhs, opts)
  local options = merge({noremap = true}, opts or {})
  options.buffer = nil
  if (opts or {}).buffer then
    vim.api.nvim_buf_set_keymap(buffer == true and 0 or buffer, mode, lhs, rhs, options)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end



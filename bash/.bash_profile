# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


. "$HOME/.cargo/env"
 
##### path for mcnp620
export PATH
PATH="/home/grant/RSICC/MCNP/MCNP6.2/MCNP_CODE/bin:$PATH"
 
 
##### path for data   
export DATAPATH
DATAPATH="/home/grant/RSICC/MCNP/MCNP6.2/MCNP_DATA"
 
 
##### path for data   
export ISCDATA
ISCDATA="/home/grant/RSICC/MCNP/MCNP6.2/MCNP_CODE/MCNP620/Utilities/ISC/data"
 
ulimit -s unlimited

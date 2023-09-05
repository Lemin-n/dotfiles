{ pkgs, inputs, ... }:
{
  imports = [ inputs.hm.nixosModule ./users ];
}
	

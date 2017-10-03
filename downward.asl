state("Downward", "v1.03 public")
{
    int loading : "Downward.exe", 0x0578B820, 0x58, 0x148, 0xAB4;
    int questState : "Downward.exe", 0x0578B820, 0x58, 0x148, 0xAB8;
}
init
{
	version = "v1.03 public";
}
startup
{
	int[] comparison = {101010,151515,202020,252525,303030,353535,404040,454545,505050,555555,606060,656565,707070,757575,808080,858585,909090,959595,100100100,105105105,110110110,115115115,120120120,125125125};
	vars.compare = comparison;
	settings.Add("auto", true, "Automatic Splits");
	settings.Add("151515", true, "Introduction", "auto");
	settings.Add("202020", false, "First Crouch", "auto");
	settings.Add("252525", false, "First Bell", "auto");
	settings.Add("303030", false, "Get The Mark", "auto");
	settings.Add("353535", false, "Second Crouch", "auto");
	settings.Add("404040", false, "First Golem", "auto");
	settings.Add("454545", false, "First Statue", "auto");
	settings.Add("505050", false, "Meet Old Man", "auto");
	settings.Add("555555", false, "Cliff Jump", "auto");
	settings.Add("656565", true, "Double Jump", "auto");
	settings.Add("808080", false, "Shrine Entrance", "auto");
	settings.Add("909090", false, "Old Man 2", "auto");
	settings.Add("959595", true, "First Gamma", "auto");
	settings.Add("100100100", true, "Get Slingshot", "auto");
	settings.Add("105105105", false, "Revert Quiescent", "auto");
	settings.Add("110110110", false, "Grab First Relic", "auto");
	settings.Add("120120120", false, "Place First Relic", "auto");
	settings.Add("125125125", false, "EA Screen", "auto");

}
start
{
	return (current.questState == 101010 && current.loading == 302010 && old.loading == 102030);
}
split
{
	//if(current.questState == 125125125)
		//return true; //end all if we reach this point -- in case of desync.
	if(current.questState != old.questState)
	{
		if(settings[current.questState.ToString()])
		{
			return true;
		}
	}
}

update
{
	if(version == "")
		return false;
}
isLoading
{
	return (current.loading != 302010);
}

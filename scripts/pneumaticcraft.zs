import mods.pneumaticcraft.pressurechamber;
import mods.gregtech.recipe.RecipeMap;

var ingotWroughtIron = <ore:ingotWroughtIron>.firstItem;
var ingotCompressedWroughtIron = <ore:ingotCompressedWroughtIron>.firstItem;

// Wrought Iron into Compressed Wrought Iron
mods.pneumaticcraft.pressurechamber.addRecipe([ingotWroughtIron * 1], 2.0, [ingotCompressedWroughtIron]);

// Pulp into Paper
for pulp in <ore:dustWood>.items {
	mods.pneumaticcraft.pressurechamber.addRecipe([pulp * 3], 1.5, [<minecraft:paper>]);
}

// Coal blocks into diamond
mods.pneumaticcraft.pressurechamber.removeRecipe([<minecraft:diamond> * 1]);
for coal in <ore:blockCoal>.items {
	mods.pneumaticcraft.pressurechamber.addRecipe([coal * 8], 4.5, [<minecraft:diamond>]);
}

// Coal ore into 3x Coal
for coal in <ore:oreCoal>.items {
	mods.pneumaticcraft.pressurechamber.addRecipe([coal * 1], 1.5, [<minecraft:coal> * 3]);
}
// Lignite ore into 3x Lignite
var lignite = <ore:gemLignite>.firstItem;
for lignite in <ore:oreLignite>.items {
	mods.pneumaticcraft.pressurechamber.addRecipe([lignite * 1], 1.5, [lignite * 3]);
}
// Redstone ore into 3x Redstone
for redstone in <ore:oreRedstone>.items {
	mods.pneumaticcraft.pressurechamber.addRecipe([redstone * 1], 1.5, [<minecraft:redstone> * 7]);
}

// GT Style block crafting
val compressor as RecipeMap = RecipeMap.getByName("compressor");

recipes.remove(<pneumaticcraft:compressed_iron_block>);
compressor.recipeBuilder()
	.inputs(<ore:ingotIronCompressed> * 9)
	.outputs(<pneumaticcraft:compressed_iron_block>)
	.duration(400).EUt(2)
	.buildAndRegister();

  
// Gregtech adds Compressed Iron with a different oredict name.
var blockCompressedIron = <ore:blockCompressedIron>; // GT version.  Good name.
var blockIronCompressed = <ore:blockIronCompressed>; // PC version.  Weird name.
var ingotCompressedIron = <ore:ingotCompressedIron>; // GT version.  Good name.
var ingotIronCompressed = <ore:ingotIronCompressed>; // PC version.  Weird name.

blockCompressedIron.addAll(blockIronCompressed);
blockIronCompressed.addAll(blockCompressedIron);
ingotCompressedIron.addAll(ingotIronCompressed);
ingotIronCompressed.addAll(ingotCompressedIron);


// Remove everything from refinery
mods.pneumaticcraft.refinery.removeAllRecipes();

// Add our oil recipes
// Current setup is dumb.  Need to make 2-refineries and 3-refineries useful.
//mods.pneumaticcraft.refinery.addRecipe(int minimumTemperature, ILiquidStack input, ILiquidStack[] outputs);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil_light> * 150, [<liquid:sulfuric_heavy_fuel> * 7, <liquid:sulfuric_light_fuel> * 10, <liquid:sulfuric_naphtha> * 9, <liquid:sulfuric_gas> * 24]);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil_light> * 150, [<liquid:sulfuric_heavy_fuel> * 7, <liquid:sulfuric_light_fuel> * 10, <liquid:sulfuric_naphtha> * 9]);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil_light> * 150, [<liquid:sulfuric_heavy_fuel> * 7, <liquid:sulfuric_light_fuel> * 10]);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil_medium> * 50, [<liquid:sulfuric_heavy_fuel> * 10, <liquid:sulfuric_light_fuel> * 25, <liquid:sulfuric_naphtha> * 6, <liquid:sulfuric_gas> * 6]);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil_medium> * 50, [<liquid:sulfuric_heavy_fuel> * 10, <liquid:sulfuric_light_fuel> * 25, <liquid:sulfuric_naphtha> * 6]);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil_medium> * 50, [<liquid:sulfuric_heavy_fuel> * 10, <liquid:sulfuric_light_fuel> * 25]);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil_heavy> * 50, [<liquid:sulfuric_heavy_fuel> * 175, <liquid:sulfuric_light_fuel> * 22, <liquid:sulfuric_naphtha> * 4, <liquid:sulfuric_gas> * 60]);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil_heavy> * 50, [<liquid:sulfuric_heavy_fuel> * 175, <liquid:sulfuric_light_fuel> * 22, <liquid:sulfuric_naphtha> * 4]);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil_heavy> * 50, [<liquid:sulfuric_heavy_fuel> * 175, <liquid:sulfuric_light_fuel> * 22]);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil> * 100, [<liquid:sulfuric_heavy_fuel> * 10, <liquid:sulfuric_light_fuel> * 25, <liquid:sulfuric_naphtha> * 6, <liquid:sulfuric_gas> * 6]);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil> * 100, [<liquid:sulfuric_heavy_fuel> * 10, <liquid:sulfuric_light_fuel> * 25, <liquid:sulfuric_naphtha> * 6]);
mods.pneumaticcraft.refinery.addRecipe(373, <liquid:oil> * 100, [<liquid:sulfuric_heavy_fuel> * 10, <liquid:sulfuric_light_fuel> * 25]);

// Remove everything from thermopneumaticprocessingplant
mods.pneumaticcraft.thermopneumaticprocessingplant.removeAllRecipes();

// Add in some probably-dumb oil conversion recipes.  Note that the machine already used redstone to make silly conversions
// mods.pneumaticcraft.thermopneumaticprocessingplant.addRecipe(ILiquidStack liquidInput, IItemStack itemInput, double pressure, double temperature, ILiquidStack output);
mods.pneumaticcraft.thermopneumaticprocessingplant.addRecipe(<liquid:oil_heavy> * 100, <minecraft:redstone>, 3.5, 473, <liquid:oil> * 70);
mods.pneumaticcraft.thermopneumaticprocessingplant.addRecipe(<liquid:oil> * 100, <minecraft:redstone>, 3.0, 423, <liquid:oil_light> * 70);
mods.pneumaticcraft.thermopneumaticprocessingplant.addRecipe(<liquid:oil_light> * 100, <minecraft:clay_ball>, 2.5, 373, <liquid:kerosene> * 70);

// Heat Frame Cooling: Pulped Biomass -> Slime Ball
var pulped_biomass = <thermalfoundation:material:816>;
var slime_ball = <minecraft:slime_ball>;
mods.pneumaticcraft.heatframecooling.addRecipe(pulped_biomass *4, slime_ball);
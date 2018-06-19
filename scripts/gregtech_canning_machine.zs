import mods.gregtech.RecipeMap;
val canner as RecipeMap = RecipeMap.getByName("canner");

canner.recipeBuilder()
    .inputs([<ore:foilGold>, <ore:dustCocoa> * 2])
    .outputs([<metaitem:coin.chocolate> * 4])
    .duration(40).EUt(30)
    .buildAndRegister();
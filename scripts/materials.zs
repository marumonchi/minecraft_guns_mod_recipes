#priority 2

import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemStack;

// 火薬 ---------------------------------------------------
global coal as IIngredient = <minecraft:coal:*>;
global gunPowder as IIngredient = <ore:gunpowder>;
global blazePowder as IIngredient = <minecraft:blaze_powder>;
//--------------------------------------------------------

// 木材 ---------------------------------------------------
global log as IIngredient = <ore:logWood>;
//--------------------------------------------------------

// 鉱石 ---------------------------------------------------

#グロウストーン
global dustGlowstone as IIngredient = <minecraft:glowstone_dust>;

# 鉄
global nuggetIron as IIngredient = <ore:nuggetIron>;
global ingotIron as IIngredient = <ore:ingotIron>;
global blockIron as IIngredient = <ore:blockIron>;

# 金
global nuggetGold as IIngredient = <ore:nuggetGold>;
global ingotGold as IIngredient = <ore:ingotGold>;
global blockGold as IIngredient = <ore:blockGold>;

# レッドストーン
global dustRedstone as IIngredient = <ore:dustRedstone>;
global blockRedstone as IIngredient = <ore:blockRedstone>;

# ダイヤ
global gemDiamond as IIngredient = <ore:gemDiamond>;
global blockDiamond as IIngredient = <ore:blockDiamond>;
//--------------------------------------------------------

recipes.addShapeless(<minecraft:gunpowder>*2, [coal, dustGlowstone, dustGlowstone, dustGlowstone]);

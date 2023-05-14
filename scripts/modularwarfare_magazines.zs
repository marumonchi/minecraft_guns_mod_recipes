import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.item.IItemCondition;
import crafttweaker.recipes.IRecipeFunction;

// mag-recipe ---------------------
# HG
val magRecipeHG = [
    [ingotIron],
    [gunPowder],
    [ingotIron]
] as IIngredient[][];

# SMG
val magRecipeSMG = [
    [ingotIron],
    [gunPowder],
    [blockIron]
] as IIngredient[][];

# AR
val magRecipeLowAR = [
    [blockIron],
    [dustGlowstone],
    [blockIron]
] as IIngredient[][];

val magRecipeAR = [
    [gemDiamond],
    [blazePowder],
    [gemDiamond]
] as IIngredient[][];

val magRecipeFastAR = [
    [gemDiamond, blockGold, gemDiamond],
    [blazePowder, gunPowder, blazePowder],
    [gemDiamond, blockGold, gemDiamond]
] as IIngredient[][];

# basic-SR
val magRecipeBasicSR = [
    [ingotGold],
    [gunPowder],
    [ingotGold]
] as IIngredient[][];

# advanced-SR
val magRecipeAdvancedSR = [
    [ingotGold],
    [blazePowder],
    [ingotGold]
] as IIngredient[][];
// --------------------------------

// magazine -----------------------
# HG
val magP88 = <modularwarfare:prototype.p88ammo>;
val magFNX45 = <modularwarfare:prototype.fnx45ammo>;

# SMG
val magMP5 = <modularwarfare:prototype.mp5ammo>;
val magMP40 = <modularwarfare:prototype.mp40ammo>;
val magUzi = <modularwarfare:prototype.uziammo>;

# AR
val magAK74U = <modularwarfare:prototype.ak74uammo>;
val magFastAK74U = <modularwarfare:prototype.ak74ufastmag>;
val magAKM = <modularwarfare:prototype.ak47ammo>;
val magHK416 = <modularwarfare:prototype.hk416ammo>;
val magM4A1 = <modularwarfare:prototype.m4a1ammo>;

# SR
val magSKS = <modularwarfare:prototype.sksammo>;
val magMosin = <modularwarfare:prototype.mosin_nagantammo>;
// --------------------------------

// magazine-grouping-list ------------------
# using HG magazine
val useHgMagArray = [magP88, magFNX45] as IItemStack[];

# using SMG magazine
val useSmgMagArray = [magMP40, magMP5, magUzi] as IItemStack[];

# using AR magazine
val useArMagArray = [magAK74U, magAKM, magHK416, magM4A1] as IItemStack[];

# using FastMag AK74U
val useFastArMagArray = [magFastAK74U] as IItemStack[];

# using basic-SR magazine
val useBasicSrMagArray = [magSKS] as IItemStack[];

# using advanced-SR magazine
val useAdvancedSrMagArray = [magMosin] as IItemStack[];
// --------------------------------

// magazin-reload-grouping-list -----------------
# using gunpowder x1
val useGunpowderX1ReloadingArray = [
    magP88, magFNX45,
    magSKS,
] as IItemStack[];

# using gunpowder x2
val useGunpowderX2ReloadingArray =[
    magMP40, magMP5, magUzi,
] as IItemStack[];

# using blaze-powder x1
val useBlazePowderX1ReloadingArray = [
    magMosin
] as IItemStack[];

# using blaze-powder x2
val useBlazePowderX2ReloadingArray = [
    magAK74U, magAKM, magHK416, magM4A1
] as IItemStack[];

# using blaze-powder x4
val useBlazePowderX4ReloadingArray = [
    magFastAK74U
] as IItemStack[];
// --------------------------------

// craft-magazine-recipe ------------------------
function AddAllMagRecipe(magArray as IItemStack[], recipe as IIngredient[][]) {
    for mag in magArray {
        recipes.addShaped(mag, recipe);
    }
}

AddAllMagRecipe(useHgMagArray, magRecipeHG);
AddAllMagRecipe(useSmgMagArray, magRecipeSMG);
AddAllMagRecipe(useArMagArray, magRecipeAR);
AddAllMagRecipe(useFastArMagArray, magRecipeFastAR);
AddAllMagRecipe(useBasicSrMagArray, magRecipeBasicSR);
AddAllMagRecipe(useAdvancedSrMagArray, magRecipeAdvancedSR);
// --------------------------------------------

// reload-magazine-recipe ----------------------------
function AddAllReloadRecipe(magArray as IItemStack[], ammo as IIngredient, ammoNum as int) {
    for mag in magArray {

        var craftRecipeArray as IIngredient[] = [mag.anyDamage().onlyDamageAtLeast(mag.maxDamage).marked("source")];
        var i = 0;
        while i < ammoNum {
            craftRecipeArray += ammo;
            i += 1;
        }

        recipes.addShapeless(mag as IItemStack,
            craftRecipeArray
        );
    }
}

AddAllReloadRecipe(useGunpowderX1ReloadingArray, gunPowder, 1);
AddAllReloadRecipe(useGunpowderX2ReloadingArray, gunPowder, 2);

AddAllReloadRecipe(useBlazePowderX1ReloadingArray, blazePowder, 1);
AddAllReloadRecipe(useBlazePowderX2ReloadingArray, blazePowder, 2);
AddAllReloadRecipe(useBlazePowderX4ReloadingArray, blazePowder, 4);
// --------------------------------------------

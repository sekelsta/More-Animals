using Vintagestory.API.Common;
using Vintagestory.API.Common.Entities;
using Vintagestory.API.MathTools;
using Vintagestory.API.Datastructures;
using Vintagestory.API.Config;
using Vintagestory.API.Util;
using Vintagestory.API.Client;
using Vintagestory.API.Server;
using Vintagestory.GameContent;
using Vintagestory.GameContent.Mechanics;
using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
namespace MoreAnimals
{

    
    public class MoreAnimalsModSystem : ModSystem
    {
        public override void Start(ICoreAPI api)
        {
            api.RegisterBlockEntityClass("BlockNestbox", typeof(BlockEntityNestBox));
        }
    }



    public class BlockEntityNestBox : BlockEntityHenBox
    {
        public override void FromTreeAttributes(ITreeAttribute tree, IWorldAccessor worldForResolving)
        {
            base.FromTreeAttributes(tree, worldForResolving);
            for (int i = 0; i < 10; i++)
            {
                string eggCode = tree.GetString("egg" + i);
                if (eggCode == null) continue;
                TreeAttribute chick = (TreeAttribute) inventory[i].Itemstack?.Attributes["chick"];
                CollectibleObject egg = (CollectibleObject)Api.World.GetBlock(eggCode) ?? (CollectibleObject)Api.World.GetItem(eggCode);
                if (egg == null) {
                    Api.World.Logger.Warning("Failed to resolve egg code {0} for {1} doing nestbox update", eggCode, Block.Code);
                    continue;
                }
                inventory[i].Itemstack = new ItemStack(egg, 1);
                inventory[i].Itemstack.Attributes["chick"] = chick;
            }
        }
    }
}

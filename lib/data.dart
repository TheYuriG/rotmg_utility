import 'package:flutter/material.dart';

// Essa variável limpa as estatisticas de summaryObject e organiza elas
Map<String, String> summaryData = {};
// Essa variavel guarda a cor da estrela da conta, para fácil acesso em outros locais.
Image starColor;

// Config file for settings on what to display.
// In the future, the app will give a menu to change these settings and they will
// be saved somewhere else and then loaded in here using the ReadStream function.
Map<String, dynamic> settings = {
  'weapons': true,
  'armor': true,
  'eggs': true,
  'rings': true,
  'pots': true,
  'class': true,
  'st': true,
  'primaryColor': Colors.white,
  'secondaryColor': Colors.black,
  'whiteTheme': true,
  'playerTracker': true,
  'playerId': "TheYuriG",
};

// This will set the image name and location to be used in the Hero animation
List heroImage = [];

List<Map> sellingItems;
List<Map> buyingItems;
// List containing all potions, plus Wine Cellar Incantantion.
List<List<String>> renderPotions = [
  ["Potion of Defense", "images/pots/defpot.png"],
  ["Potion of Attack", "images/pots/atkpot.png"],
  ["Potion of Speed", "images/pots/spdpot.png"],
  ["Potion of Dexterity", "images/pots/dexpot.png"],
  ["Potion of Wisdom", "images/pots/wispot.png"],
  ["Potion of Vitality", "images/pots/vitpot.png"],
  ["Potion of Mana", "images/pots/manapot.png"],
  ["Potion of Life", "images/pots/lifepot.png"],
  ["Greater Potion of Defense", "images/pots/gdefpot.png"],
  ["Greater Potion of Attack", "images/pots/gatkpot.png"],
  ["Greater Potion of Speed", "images/pots/gspdpot.png"],
  ["Greater Potion of Dexterity", "images/pots/gdexpot.png"],
  ["Greater Potion of Wisdom", "images/pots/gwispot.png"],
  ["Greater Potion of Vitality", "images/pots/gvitpot.png"],
  ["Greater Potion of Mana", "images/pots/gmanapot.png"],
  ["Greater Potion of Life", "images/pots/glifepot.png"],
  ["Any Pot", "images/pots/mystery.png"],
  ["Wine Cellar Incantation", "images/pots/inc.png"]
];
// List containing basic weapons
List<List<String>> renderWeapons = [
  ["Staff of Necrotic Arcana", "images/weapons/stafft9.png"],
  ["Staff of Diabolic Secrets", "images/weapons/stafft10.png"],
  ["Staff of Astral Knowledge", "images/weapons/stafft11.png"],
  ["Staff of the Cosmic Whole", "images/weapons/stafft12.png"],
  ["Wand of Deep Sorcery", "images/weapons/wandt9.png"],
  ["Wand of Shadow", "images/weapons/wandt10.png"],
  ["Wand of Ancient Warning", "images/weapons/wandt11.png"],
  ["Wand of Recompense", "images/weapons/wandt12.png"],
  ["Verdant Bow", "images/weapons/bowt9.png"],
  ["Bow of Fey Magic", "images/weapons/bowt10.png"],
  ["Bow of Innocent Blood", "images/weapons/bowt11.png"],
  ["Bow of Covert Havens", "images/weapons/bowt12.png"],
  ["Ragetalon Dagger", "images/weapons/daggert9.png"],
  ["Emeraldshard Dagger", "images/weapons/daggert10.png"],
  ["Agateclaw Dagger", "images/weapons/daggert11.png"],
  ["Dagger of Foul Malevolence", "images/weapons/daggert12.png"],
  ["Dragonsoul Sword", "images/weapons/swordt9.png"],
  ["Archon Sword", "images/weapons/swordt10.png"],
  ["Skysplitter Sword", "images/weapons/swordt11.png"],
  ["Sword of Acclaim", "images/weapons/swordt12.png"],
  ["Jewel Eye Katana", "images/weapons/katanat9.png"],
  ["Ichimonji", "images/weapons/katanat10.png"],
  ["Muramasa", "images/weapons/katanat11.png"],
  ["Masamune", "images/weapons/katanat12.png"]
];
// List containing basic armor
List<List<String>> renderArmor = [
  ["Robe of the Master", "images/armor/robet9.png"],
  ["Robe of the Shadow Magus", "images/armor/robet10.png"],
  ["Robe of the Moon Wizard", "images/armor/robet11.png"],
  ["Robe of the Elder Warlock", "images/armor/robet12.png"],
  ["Robe of the Grand Sorcerer", "images/armor/robet13.png"],
  ["Dragonscale Armor", "images/armor/armort9.png"],
  ["Desolation Armor", "images/armor/armort10.png"],
  ["Vengeance Armor", "images/armor/armort11.png"],
  ["Abyssal Armor", "images/armor/armort12.png"],
  ["Acropolis Armor", "images/armor/armort13.png"],
  ["Drake Hide Armor", "images/armor/hidet9.png"],
  ["Roc Leather Armor", "images/armor/hidet10.png"],
  ["Hippogriff Hide Armor", "images/armor/hidet11.png"],
  ["Griffon Hide Armor", "images/armor/hidet12.png"],
  ["Hydra Skin Armor", "images/armor/hidet13.png"],
];
// List containing basic class items (skills)
List<List<String>> renderClassItems = [
  ["Cloak of Endless Twilight", "images/class/cloakt5.png"],
  ["Cloak of Ghostly Concealment", "images/class/cloakt6.png"],
  ["Golden Quiver", "images/class/quivert5.png"],
  ["Quiver of Elvish Mastery", "images/class/quivert6.png"],
  ["Magic Nova Spell", "images/class/spellt5.png"],
  ["Elemental Detonation Spell", "images/class/spellt6.png"],
  ["Tome of Divine Favor", "images/class/tomet5.png"],
  ["Tome of Holy Guidance", "images/class/tomet6.png"],
  ["Golden Helm", "images/class/helmt5.png"],
  ["Helm of the Great General", "images/class/helmt6.png"],
  ["Mithril Shield", "images/class/shieldt5.png"],
  ["Colossus Shield", "images/class/shieldt6.png"],
  ["Seal of the Holy Warrior", "images/class/sealt5.png"],
  ["Seal of the Blessed Champion", "images/class/sealt6.png"],
  ["Nightwing Venom", "images/class/poisont5.png"],
  ["Baneserpent Poison", "images/class/poisont6.png"],
  ["Lifedrinker Skull", "images/class/skullt5.png"],
  ["Bloodsucker Skull", "images/class/skullt6.png"],
  ["Dragonstalker Trap", "images/class/trapt5.png"],
  ["Giantcatcher Trap", "images/class/trapt6.png"],
  ["Banishment Orb", "images/class/orbt5.png"],
  ["Planefetter Orb", "images/class/orbt6.png"],
  ["Prism of Phantoms", "images/class/prismt5.png"],
  ["Prism of Apparitions", "images/class/prismt6.png"],
  ["Scepter of Skybolts", "images/class/sceptert5.png"],
  ["Scepter of Storms", "images/class/sceptert6.png"],
  ["Ice Star", "images/class/start5.png"],
  ["Doom Circle", "images/class/start6.png"],
  ["Jade-Imbued Wakizashi", "images/class/wakizakit5.png"],
  ["Royal Wakizashi", "images/class/wakizakit6.png"],
  ["Regal Lute", "images/class/lutet5.png"],
  ["Skyward Lute", "images/class/lutet6.png"]
];
// List containing rings
List<List<String>> renderRings = [
  ["Ring of Paramount Attack", "images/rings/atkt4.png"],
  ["Ring of Paramount Defense", "images/rings/deft4.png"],
  ["Ring of Paramount Speed", "images/rings/spdt4.png"],
  ["Ring of Paramount Vitality", "images/rings/vitt4.png"],
  ["Ring of Paramount Wisdom", "images/rings/wist4.png"],
  ["Ring of Paramount Dexterity", "images/rings/dext4.png"],
  ["Ring of Paramount Health", "images/rings/lifet4.png"],
  ["Ring of Paramount Magic", "images/rings/manat4.png"],
  ["Ring of Exalted Attack", "images/rings/atkt5.png"],
  ["Ring of Exalted Defense", "images/rings/deft5.png"],
  ["Ring of Exalted Speed", "images/rings/spdt5.png"],
  ["Ring of Exalted Vitality", "images/rings/vitt5.png"],
  ["Ring of Exalted Wisdom", "images/rings/wist5.png"],
  ["Ring of Exalted Dexterity", "images/rings/dext5.png"],
  ["Ring of Exalted Health", "images/rings/lifet5.png"],
  ["Ring of Exalted Magic", "images/rings/manat5.png"],
  ["Ring of Unbound Attack", "images/rings/atkt6.png"],
  ["Ring of Unbound Defense", "images/rings/deft6.png"],
  ["Ring of Unbound Speed", "images/rings/spdt6.png"],
  ["Ring of Unbound Vitality", "images/rings/vitt6.png"],
  ["Ring of Unbound Wisdom", "images/rings/wist6.png"],
  ["Ring of Unbound Dexterity", "images/rings/dext6.png"],
  ["Ring of Unbound Health", "images/rings/lifet6.png"],
  ["Ring of Unbound Magic", "images/rings/manat6.png"],
  ["Ring of Decades", "images/rings/deca.png"]
];
// List containing eggs
List<List<String>> renderEggs = [
  ["Common Feline Egg", "images/eggs/cfeline.png"],
  ["Common Canine Egg", "images/eggs/ccanine.png"],
  ["Common Avian Egg", "images/eggs/cavian.png"],
  ["Common Exotic Egg", "images/eggs/cexotic.png"],
  ["Common Farm Egg", "images/eggs/cfarm.png"],
  ["Common Woodland Egg", "images/eggs/cwoodland.png"],
  ["Common Reptile Egg", "images/eggs/creptile.png"],
  ["Common Insect Egg", "images/eggs/cinsect.png"],
  ["Common Penguin Egg", "images/eggs/cpenguin.png"],
  ["Common Aquatic Egg", "images/eggs/caquatic.png"],
  ["Common Spooky Egg", "images/eggs/cspooky.png"],
  ["Common Humanoid Egg", "images/eggs/chumanoid.png"],
  ["Common ???? Egg", "images/eggs/cwhat.png"],
  ["Common Automaton Egg", "images/eggs/cautomaton.png"],
  ["Common Mystery Egg", "images/eggs/cmystery.png"],
  ["Uncommon Feline Egg", "images/eggs/uncfeline.png"],
  ["Uncommon Canine Egg", "images/eggs/unccanine.png"],
  ["Uncommon Avian Egg", "images/eggs/uncavian.png"],
  ["Uncommon Exotic Egg", "images/eggs/uncexotic.png"],
  ["Uncommon Farm Egg", "images/eggs/uncfarm.png"],
  ["Uncommon Woodland Egg", "images/eggs/uncwoodland.png"],
  ["Uncommon Reptile Egg", "images/eggs/uncreptile.png"],
  ["Uncommon Insect Egg", "images/eggs/uncinsect.png"],
  ["Uncommon Penguin Egg", "images/eggs/uncpenguin.png"],
  ["Uncommon Aquatic Egg", "images/eggs/uncaquatic.png"],
  ["Uncommon Spooky Egg", "images/eggs/uncfeline.png"],
  ["Uncommon Humanoid Egg", "images/eggs/unchumanoid.png"],
  ["Uncommon ???? Egg", "images/eggs/uncwhat.png"],
  ["Uncommon Automaton Egg", "images/eggs/uncautomaton.png"],
  ["Uncommon Mystery Egg", "images/eggs/uncmystery.png"]
];
// List containing the ST equips
List<List<String>> specialThemed = [
  // This is the Phylactery Mystic Set (source: https://www.realmeye.com/wiki/phylactery-mystic-set)
  ["The Phylactery", "images/weapons/staff_souless.png"],
  ["Soul of the Bearer", "images/class/orb_souless.png"],
  ["Soulless Robe", "images/armor/robe_souless.png"],
  ["Ring of the Covetous Heart", "images/rings/ring_souless.png"],
  // This is the Priest of Geb Set (source: https://www.realmeye.com/wiki/priest-of-geb-set)
  ["Wand of Geb", "images/weapons/wand_geb.png"],
  ["Book of Geb", "images/class/tome_geb.png"],
  ["Shendyt of Geb", "images/armor/robe_geb.png"],
  ["Geb's Ring of Wisdom", "images/rings/ring_geb.png"],
  // Other sets aren't added because they don't provide a set bonus for every piece like these above.
  // It's a design option, not an oversight.
];

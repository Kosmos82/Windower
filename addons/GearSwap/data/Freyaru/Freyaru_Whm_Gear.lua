-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')

	gear.obi_cure_waist = "Austerity Belt +1"
	gear.obi_cure_back = "Alaunus's Cape"


	gear.obi_nuke_waist = "Sekhmet Corset"
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_nuke_back = "Toro Cape"

	gear.fc_jse_back = {name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Fast Cast"+10','Damage taken-3%',}}
	gear.cure_jse_back = 

		-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Izcalli",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Izcalli",sub="Nehushtan"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		main="Daybreak",
		sub="Culminus",
		ammo="Incantor Stone",
		head="Pinga Crown",
		body="Inyanga Jubbah +2",
		hands="Pinga Mittens",
		legs="Pinga Pants",
		feet="Pinga Pumps",
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back=gear.fc_jse_back,
	}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +1"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main="Queller Rod", 
    	sub="Sors Shield",
    	ammo="Incantor Stone",
    	head="Kaykaus Mitra +1", 
    	body="Kaykaus Bliaut +1", 
    	hands="Kaykaus Cuffs +1", 
    	legs="Ebers Pantaloons",
    	feet="Cure Clogs",
    	neck="Aceso/'s Choker +1", 
    	waist="Acerbic Sash +1"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Culminus"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Nahtirah Hat",ear1="Roundel Earring",
		body="Piety Briault +1",hands="Telchine Gloves",
		waist="Chaac Belt",back="Aurist's Cape +1"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
		body="Kaykaus Bliaut",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Buquwik Cape",waist="Fotia Belt",legs="Assid. Pants +1",feet="Gende. Galosh. +1"}
		
    sets.precast.WS.Dagan = {ammo="Hasty Pinion +1",
		head="Befouled Crown",neck="Asperity Necklace",ear1="Etiolation Earring",ear2="Moonshade Earring",
		body="Kaykaus Bliaut",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Buquwik Cape",waist="Fotia Belt",legs="Assid. Pants +1",feet="Gende. Galosh. +1"}
		
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.MaxTP.Dagan = {ear1="Etiolation Earring",ear2="Evans Earring"}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {back="Umbra Cape"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {main=gear.grioavolr_fc_staff,sub="Umbra Strap",ammo="Hasty Pinion +1",
		head="Vanya Hood",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Gwati Earring",
		body="Vedic Coat",hands="Fanatic Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Solemnity Cape",waist="Austerity Belt +1",legs="Vanya Slops",feet="Medium's Sabots"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {
		main="Daybreak",
		sub="Culminus",
		ammo="Incantor Stone",
		head="Pinga Crown",
		body="Inyanga Jubbah +2",
		hands="Pinga Mittens",
		legs="Pinga Pants",
		feet="Pinga Pumps",
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back=gear.fc_jse_back}
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
		main="Queller Rod", 
		sub="Sors Shield",
		ammo="Oreiad's Tathlum",
		head="Kaykaus Mitra +1", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Ebers Pantaloons",
		feet="Pinga Pumps",
		neck="Clr. Torque +2", 
		waist="Embla Sash",
		left_ear="Roundel Earring",
		right_ear="Meili Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring",
		back=gear.cure_jse_back}
		
	sets.midcast.CureSolace = {
		main="Queller Rod", 
		sub="Sors Shield",
		ammo="Oreiad's Tathlum",
		head="Kaykaus Mitra +1", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Ebers Pantaloons",
		feet="Pinga Pumps",
		neck="Clr. Torque +2", 
		waist="Embla Sash",
		left_ear="Roundel Earring",
		right_ear="Meili Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring",
		back=gear.cure_jse_back}

	sets.midcast.LightWeatherCure = {
		main="Queller Rod", 
		sub="Sors Shield",
		ammo="Oreiad's Tathlum",
		head="Kaykaus Mitra +1", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Ebers Pantaloons",
		feet="Pinga Pumps",
		neck="Clr. Torque +2", 
		waist="Embla Sash",
		left_ear="Roundel Earring",
		right_ear="Meili Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring",
		back=gear.cure_jse_back}

	sets.midcast.LightWeatherCureSolace = {
		main="Queller Rod", 
		sub="Sors Shield",
		ammo="Oreiad's Tathlum",
		head="Kaykaus Mitra +1", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Ebers Pantaloons",
		feet="Pinga Pumps",
		neck="Clr. Torque +2", 
		waist="Embla Sash",
		left_ear="Roundel Earring",
		right_ear="Meili Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring",
		back=gear.cure_jse_back}
		
	sets.midcast.LightDayCureSolace = {
		main="Queller Rod", 
		sub="Sors Shield",
		ammo="Oreiad's Tathlum",
		head="Kaykaus Mitra +1", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Ebers Pantaloons",
		feet="Pinga Pumps",
		neck="Clr. Torque +2", 
		waist="Embla Sash",
		left_ear="Roundel Earring",
		right_ear="Meili Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring",
		back=gear.cure_jse_back}

	sets.midcast.LightDayCure = {
		main="Queller Rod", 
		sub="Sors Shield",
		ammo="Oreiad's Tathlum",
		head="Kaykaus Mitra +1", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Ebers Pantaloons",
		feet="Pinga Pumps",
		neck="Clr. Torque +2", 
		waist="Embla Sash",
		left_ear="Roundel Earring",
		right_ear="Meili Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring",
		back=gear.cure_jse_back}

	sets.midcast.Curaga = {
		main="Queller Rod", 
		sub="Sors Shield",
		ammo="Oreiad's Tathlum",
		head="Kaykaus Mitra +1", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Ebers Pantaloons",
		feet="Pinga Pumps",
		neck="Clr. Torque +2", 
		waist="Embla Sash",
		left_ear="Roundel Earring",
		right_ear="Meili Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring",
		back=gear.cure_jse_back}
		
	sets.midcast.LightWeatherCuraga = {
		main="Queller Rod", 
		sub="Sors Shield",
		ammo="Oreiad's Tathlum",
		head="Kaykaus Mitra +1", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Ebers Pantaloons",
		feet="Pinga Pumps",
		neck="Clr. Torque +2", 
		waist="Embla Sash",
		left_ear="Roundel Earring",
		right_ear="Meili Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring",
		back=gear.cure_jse_back}
		
	sets.midcast.LightDayCuraga = {
		main="Queller Rod", 
		sub="Sors Shield",
		ammo="Oreiad's Tathlum",
		head="Kaykaus Mitra +1", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Ebers Pantaloons",
		feet="Pinga Pumps",
		neck="Clr. Torque +2", 
		waist="Embla Sash",
		left_ear="Roundel Earring",
		right_ear="Meili Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring",
		back=gear.cure_jse_back}

	sets.midcast.Cure.DT = {main="Queller Rod", 
		sub="Sors Shield",
		ammo="Oreiad's Tathlum",
		head="Kaykaus Mitra +1", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Ebers Pantaloons",
		feet="Pinga Pumps",
		neck="Clr. Torque +2", 
		waist="Embla Sash",
		left_ear="Roundel Earring",
		right_ear="Meili Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring",
		back=gear.cure_jse_back}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {
		ammo="Oreiad's Tathlum",
		head="Kaykaus Mitra +1", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Ebers Pantaloons",
		feet="Pinga Pumps",
		neck="Clr. Torque +2", 
		waist="Embla Sash",
		left_ear="Roundel Earring",
		right_ear="Meili Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring",
		back=gear.cure_jse_back}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {
		main="Yagrush",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",
		body="Hyksos Robe",
		hands="Chironic Gloves", 
		legs="Piety Pantaln. +1", 
		feet="Revealer's Pumps",
		neck="Imbodla Necklace",
		waist="Embla Sash",
		left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring"}

	sets.midcast.StatusRemoval = {
		main="Yagrush",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",
		body="Hyksos Robe",
		hands="Chironic Gloves", 
		legs="Piety Pantaln. +1", 
		feet="Revealer's Pumps",
		neck="Imbodla Necklace",
		waist="Embla Sash",
		left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		left_ring="Menelaus's Ring",
		right_ring="Lebeche Ring"}
		
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Clr. Torque +2"})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {
		main="Beneficus",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",
		body="Hyksos Robe",
		hands="Chironic Gloves", 
		legs="Piety Pantaln. +1", 
		feet="Revealer's Pumps",
		neck="Imbodla Necklace",
		waist="Embla Sash",
		left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}
	

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {hands="Ebers Mitts +1",legs="Th. Pant. +3",})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Sekhmet Corset"})
	
	sets.midcast.BarElement = {
		main="Beneficus",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",
		body="Hyksos Robe",
		hands="Chironic Gloves", 
		legs="Piety Pantaln. +1", 
		feet="Revealer's Pumps",
		neck="Imbodla Necklace",
		waist="Embla Sash",
		left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}
	

	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Twilight Cloak",hands=gear.chironic_enfeeble_hands,ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back="Toro Cape",waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'] = {
		main="Maxentius",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}

	sets.midcast['Elemental Magic'].Resistant = {
		main="Maxentius",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}

	sets.midcast['Divine Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}
		
	sets.midcast.Holy = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}

	sets.midcast['Dark Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}

    sets.midcast.Drain = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}

    sets.midcast.Drain.Resistant = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}

	sets.midcast.Stun.Resistant = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}
		
	sets.midcast.Dispel = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1"}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})

	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1"}
		

	sets.midcast['Enfeebling Magic'].Resistant = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Memoria Sachet",
		head="Chironic Hat", 
		body="Kaykaus Bliaut +1", 
		hands="Kaykaus Cuffs +1", 
		legs="Revealer's Pants",
		feet="Chironic Slippers", 
		neck="Erra Pendant",
		waist="Rumination Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1"}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back="Alaunus's Cape"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {back="Alaunus's Cape"})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Ebers Bliaud +1",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
		main="Daybreak",
    	sub="Culminus",
    	ammo="Staunch Tathlum",
    	head="Chironic Hat", 
    	body="Kaykaus Bliaut +1", 
    	hands="Chironic Gloves", 
    	legs="Chironic Hose", 
    	feet="Chironic Slippers",
    	neck="Twilight Torque",
    	waist="Embla Sash",
    	left_ear="Etiolation Earring",
    	right_ear="Hearty Earring",
    	left_ring="Stikini Ring +1",
    	right_ring="Stikini Ring +1",
    	back="Moonbeam Cape"}

	sets.idle.PDT = {
		main="Mafic Cudgel",
		sub="Culminus",
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Revealer's Pants",
		feet="Pinga Pumps",
		neck="Twilight Torque",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Gelatinous Ring",
		back="Moonbeam Cape"}
		
	sets.idle.MDT = {
		main="Mafic Cudgel",
		sub="Culminus",
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Revealer's Pants",
		feet="Pinga Pumps",
		neck="Twilight Torque",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Gelatinous Ring",
		back="Moonbeam Cape"}

	sets.idle.Weak = {
		main="Mafic Cudgel",
		sub="Culminus",
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Revealer's Pants",
		feet="Pinga Pumps",
		neck="Twilight Torque",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Gelatinous Ring",
		back="Moonbeam Cape"}
    -- Defense sets

	sets.defense.PDT = {
		main="Malignance Pole",
		sub="Enki Strap",
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Revealer's Pants",
		feet="Pinga Pumps",
		neck="Twilight Torque",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Gelatinous Ring",
		back="Moonbeam Cape"}

	sets.defense.MDT = {
		main="Malignance Pole",
		sub="Enki Strap",
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Revealer's Pants",
		feet="Pinga Pumps",
		neck="Twilight Torque",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Gelatinous Ring",
		back="Moonbeam Cape"}

    sets.defense.MEVA = {
		main="Malignance Pole",
		sub="Enki Strap",
		ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Revealer's Pants",
		feet="Pinga Pumps",
		neck="Twilight Torque",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Gelatinous Ring",
		back="Moonbeam Cape"}

		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {ammo="Staunch Tathlum +1",
        head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back="Kayapa Cape",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}

    sets.engaged.Acc = {ammo="Hasty Pinion +1",
        head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back="Kayapa Cape",waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	sets.engaged.DW = {ammo="Staunch Tathlum +1",
        head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Telos Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}

    sets.engaged.DW.Acc = {ammo="Hasty Pinion +1",
        head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}

	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}

	sets.HPCure = {main="Queller Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Blistering Sallet +1",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Alaunus's Cape",waist="Eschan Stone",legs="Ebers Pant. +1",feet="Kaykaus Boots"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(3, 6)
end
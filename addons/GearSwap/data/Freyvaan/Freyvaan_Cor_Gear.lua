-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','Leaden','DualWeapons','DualSavageWeapons','DualLeadenRanged','DualLeadenMelee','DualAeolian','DualLeadenMeleeAcc','DualRanged','None')
	state.CompensatorMode:options('Always','300','1000','Never')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Living Bullet"
    options.ammo_warning_limit = 15

	gear.tp_ranger_jse_back = {name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+3','"Store TP"+10',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle", augments={'"Snapshot"+10',}}
	gear.tp_jse_back = {name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.qd_jse_back = {name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','"Mag.Atk.Bns."+10',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.agi_wsd_jse_back = {name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.fc_jse_back = {name="Camulus's Mantle", augments={'"Fast Cast"+10','Phys. dmg. taken-10%',}}

	gear.af1_head = {name="Laksa. Tricorne +3",}
	gear.af1_body = {name="Laksa. Frac +3",}
	gear.af1_hands = {name="Laksa. Gants +2",}
	gear.af1_legs = {name="Laksa. Trews +2",}
	gear.af1_feet = {name="Laksa. Bottes +3",}

	gear.rostam_roll = {name="Rostam", augments={'Path: C',}}
	gear.rostam_damage = {name="Rostam", augments={'Path: A',}}
	
	gear.af2_head = {name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}}
	gear.af2_body = {name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}}
	gear.af2_hands = {name="Lanun Gants +3", augments={'Enhances "Fold" effect',}}
	gear.af2_legs = {name="Lanun Trews +3", augments={'Enhances "Snake Eye" effect',}}
	gear.af2_feet = {name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}}

	gear.af3_head = {name="Chass. Tricorne",}
	gear.af3_body = {name="Chasseur's Frac",}
	gear.af3_hands = {name="Chasseur's Gants",}
	gear.af3_legs = {name="Nvrch. Culottes +2",}
	gear.af3_feet = {name="Chasseur's Bottes",}

	gear.dp = {name="Death Penalty", augments={'Path: A',}}
	gear.fomal = { name="Fomalhaut", augments={'Path: A',}}

    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind !r gs c weapons DualSavageWeapons;gs c update')
	send_command('bind ^q gs c weapons DualAeolian;gs c update')
	send_command('bind @q gs c weapons DualKustawi;gs c update')
	send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
	send_command('bind @pause roller roll')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
     --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs
	sets.precast.JA['Double-Up'] = {
		right_ring="Luzaf's Ring",
		back=gear.tp_jse_back,														
	}
	sets.precast.JA['Triple Shot'] = {
		body=gear.af3_body,
	}
    sets.precast.JA['Snake Eye'] = {
		legs=gear.af2_legs,
		back=gear.tp_jse_back,
	}
    sets.precast.JA['Wild Card'] = {
		feet=gear.af2_feet,
		back=gear.tp_jse_back,
	}
		sets.precast.JA['Random Deal'] = {
		body=gear.af2_body,
		back=gear.tp_jse_back,
	}
	sets.precast.FoldDoubleBust = {
		gear.af2_hands,
	}	
    sets.precast.CorsairRoll = {
        head=gear.af2_head,
		body=gear.af2_body,
		hands=gear.af3_hands,
		legs=gear.af2_legs,
		feet=gear.af1_feet,
		neck="Regal Necklace",
		waist="Isa Belt",
		left_ear="Etiolation Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Luzaf's Ring",
		back=gear.fc_jse_back,
	}
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs=gear.af3_legs})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet=gear.af3_feet})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head=gear.af3_head})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body=gear.af3_body})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands=gear.af3_hands})
    
    sets.precast.CorsairShot = {
		ammo="Living Bullet",
		head=gear.af1_head,
		body=gear.af2_body,
		hands="Carmine Fin. Ga. +1",
		legs=gear.herculean_nuke_legs,
		feet=gear.af3_feet,
		neck="Comm. Charm +2",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Dingir Ring",
		right_ring="Arvina Ringlet +1",
		back=gear.qd_jse_back,
	}
		
	sets.precast.CorsairShot.Damage = {
		ammo="Living Bullet",
		head=gear.af1_head,
		body=gear.af2_body,
		hands="Carmine Fin. Ga. +1",
		legs=gear.herculean_nuke_legs,
		feet=gear.af1_feet,
		neck="Comm. Charm +2",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Dingir Ring",
		right_ring="Arvina Ringlet +1",
		back=gear.qd_jse_back,
	}
	
    sets.precast.CorsairShot.Proc = {	
		ammo="Living Bullet",
		head=gear.af1_head,
		body=gear.af2_body,
		hands="Carmine Fin. Ga. +1",
		legs=gear.herculean_nuke_legs,
		feet=gear.af1_feet,
		neck="Comm. Charm +2",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Dingir Ring",
		right_ring="Arvina Ringlet +1",
		back=gear.qd_jse_back,
	}

    sets.precast.CorsairShot['Light Shot'] = {
		ammo="Living Bullet",
		head=gear.af1_head,
		body=gear.af2_body,
		hands="Carmine Fin. Ga. +1",
		legs=gear.herculean_nuke_legs,
		feet=gear.af1_feet,
		neck="Comm. Charm +2",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Dingir Ring",
		right_ring="Arvina Ringlet +1",
		back=gear.qd_jse_back,
	}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Malignance Chapeau",
		body="Passion Jacket",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Orpheus's Sash",
		left_ear="Odnowa Earring +1",
		right_ear="Tuisto Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
							}
		
	sets.Self_Waltz = {
		head="Mummu Bonnet +2",
		body="Passion Jacket",
						}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask +1",
		body="Malignance Tabard",
		hands=gear.af2_hands,
		legs=gear.af2_legs,
		feet="Carmine Greaves +1", 
		neck="Baetyl Pendant",
		waist="Isa Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Defending Ring",
		right_ring="Kishar Ring",
		back=gear.fc_jse_back,
	}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {
		head=gear.af3_head,
		body="Oshosi Vest +1",
		hands="Carmine Fin. Ga. +1", 
		legs=gear.adhemar_rng_legs,
		feet="Meg. Jam. +2",
		neck="Comm. Charm +2", 
		waist="Impulse Belt",
		left_ear="Moonshade Earring",
		right_ear="Etiolation Earring",
		left_ring="Dingir Ring",
		right_ring="Arvina Ringlet +1",
		back=gear.snapshot_jse_back,
	}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head=gear.herculean_wsd_head,
		body=gear.af1_body,
		hands="Meg. Jam. +2",
		legs=gear.herculean_wsd_legs,
		feet=gear.af2_feet,
		neck="Comm. Charm +2", 
		waist="Sailfi Belt +1", 
		left_ear="Ishvara Earring",
		right_ear="Moonshade Earring", 
		left_ring="Regal Ring",
		right_ring="Petrov Ring",
		back=gear.str_wsd_jse_back,
	}
		
    sets.precast.WS.Acc = {}		
		
    sets.precast.WS.Proc = {}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] =  {
		head=gear.herculean_wsd_head,
		body=gear.af1_body,
		hands="Meg. Jam. +2",
		legs=gear.herculean_wsd_legs,
		feet=gear.af2_feet,
		neck="Comm. Charm +2", 
		waist="Sailfi Belt +1", 
		left_ear="Ishvara Earring",
		right_ear="Moonshade Earring", 
		left_ring="Regal Ring",
		right_ring="Petrov Ring",
		back=gear.str_wsd_jse_back,
	}

	sets.precast.WS['Savage Blade'] = {
		head=gear.herculean_wsd_head,
		body=gear.af1_body,
		hands="Meg. Jam. +2",
		legs=gear.herculean_wsd_legs,
		feet=gear.af2_feet,
		neck="Comm. Charm +2", 
		waist="Sailfi Belt +1", 
		left_ear="Ishvara Earring",
		right_ear="Moonshade Earring", 
		left_ring="Regal Ring",
		right_ring="Petrov Ring",
		back=gear.str_wsd_jse_back,
	}
	

    sets.precast.WS['Savage Blade'].Acc = {}
	
	sets.precast.WS['Evisceration'] = {
		head=gear.herculean_ra_wsd_head,
		body=gear.af1_body,
		hands="Meg. Jam. +2",
		legs=gear.herculean_wsd_legs,
		feet=gear.af2_feet,
		neck="Maskirova Torque", 
		waist="Shadow Belt",
		left_ear="Ishvara Earring",
		right_ear="Moonshade Earring", 
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back=gear.tp_jse_back,
	}
										
	sets.precast.WS['Viper Bite'] = {
		head=gear.herculean_raw_sd_head,
		body=gear.af1_body,
		hands="Meg. Jam. +2",
		legs=gear.herculean_wsd_legs,
		feet=gear.af2_feet,
		neck="Maskirova Torque", 
		waist="Grunfeld Rope",
		left_ear="Ishvara Earring",
		right_ear="Moonshade Earring", 
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back=gear.tp_jse_back,
	}								
	
	sets.precast.WS['Flat Blade'] = {
		head=gear.herculean_wsd_head,
		body=gear.af1_body,
		hands="Meg. Jam. +2",
		legs=gear.herculean_wsd_legs,
		feet=gear.af2_feet,
		neck="Comm. Charm +2", 
		waist="Sailfi Belt +1", 
		left_ear="Ishvara Earring",
		right_ear="Moonshade Earring", 
		left_ring="Regal Ring",
		right_ring="Petrov Ring",
		back=gear.str_wsd_jse_back,
	}								
										
	
    sets.precast.WS['Last Stand'] = {
		ammo="Chrono Bullet",
		head=gear.herculean_ra_wsd_head,
		body=gear.af1_body,
		hands="Meg. Jam. +2",
		legs=gear.herculean_wsd_legs,
		feet=gear.af2_feet,
		neck="Comm. Charm +2", 
		waist="Aqua Belt",
		left_ear="Ishvara Earring",
		right_ear="Moonshade Earring", 
		left_ring="Regal Ring",
		right_ring="Ilabrat Ring",
		back=gear.agi_wsd_jse_back,
	}					

    sets.precast.WS['Last Stand'].Acc = {}
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc

	sets.precast.WS['Leaden Salute'] = {
		ammo="Living Bullet",
		head="Pixie Hairpin +1",
		body=gear.herculean_mab_body,
		hands="Carmine Fin. Ga. +1",
		legs=gear.herculean_nuke_legs,
		feet=gear.herculean_nuke_feet,
		neck="Comm. Charm +2", 
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Moonshade Earring", 
		left_ring="Dingir Ring",
		right_ring="Archon Ring",
		back=gear.magic_wsd_jse_back,
	}

    sets.precast.WS['Aeolian Edge'] = {
		ammo="Living Bullet",
		head=gear.herculean_wsd_head,
		body=gear.herculean_nuke_body,
		hands="Carmine Fin. Ga. +1",
		legs=gear.herculean_nuke_legs,
		feet=gear.herculean_magic_wsd_feet,
		neck="Comm. Charm +2", 
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Moonshade Earring", 
		left_ring="Dingir Ring",
		right_ring="Arvina Ringlet +1",
		back=gear.magic_wsd_jse_back,
	}

	sets.precast.WS['Wildfire'] = {
		ammo="Living Bullet",
		head=gear.herculean_wsd_head,
		body=gear.herculean_nuke_body,
		hands="Carmine Fin. Ga. +1",
		legs=gear.herculean_nuke_legs,
		feet=gear.herculean_magic_wsd_feet,
		neck="Comm. Charm +2", 
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Moonshade Earring", 
		left_ring="Dingir Ring",
		right_ring="Arvina Ringlet +1",
		back=gear.magic_wsd_jse_back,
	}
    

    sets.precast.WS['Wildfire'].Acc = {}
		
    sets.precast.WS['Hot Shot'] = {
		ammo="Living Bullet",
		head=gear.herculean_wsd_head,
		body=gear.herculean_mab_body,
		hands="Carmine Fin. Ga. +1",
		legs=gear.herculean_nuke_legs,
		feet=gear.herculean_magic_wsd_feet,
		neck="Comm. Charm +2", 
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Moonshade Earring", 
		left_ring="Dingir Ring",
		right_ring="Arvina Ringlet +1",
		back=gear.magic_wsd_jse_back,
	}
									
    sets.precast.WS['Hot Shot'].Acc = {}
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {
		ammo="Living Bullet",
		head=gear.herculean_wsd_head,
		body=gear.herculean_mab_body,
		hands="Carmine Fin. Ga. +1",
		legs=gear.herculean_nuke_legs,
		feet=gear.herculean_magic_wsd_feet,
		neck="Comm. Charm +2", 
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Moonshade Earring", 
		left_ring="Dingir Ring",
		right_ring="Arvina Ringlet +1",
		back=gear.magic_wsd_jse_back,
	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Orpheus's Sash",
		left_ear="Odnowa Earring +1",
		right_ear="Tuisto Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
								}
        
    -- Specific spells

	sets.midcast.Cure = {
        head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Orpheus's Sash",
		left_ear="Odnowa Earring +1",
		right_ear="Tuisto Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
						}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	sets.Protect_Received = {ring2="Sheltered Ring",}
	sets.Shell_Received = {ring2="Sheltered Ring",}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {
		ammo="Chrono Bullet",
        head="Oshosi Mask +1",
    	body="Oshosi Vest +1",
    	hands="Meg. Gloves +2",
		legs=gear.af2_legs,
		feet=gear.adhemar_rng_feet,
		neck="Iskur Gorget",
		waist="K. Kachina Belt +1",
		left_ear="Telos Earring",
		right_ear="Enervating Earring",
		left_ring="Regal Ring",
		right_ring="Dingir Ring",
		back=gear.tp_ranger_jse_back,
	}

    sets.midcast.RA.Acc = {}
		
	sets.buff['Triple Shot'] = {
	head="Oshosi Mask +1",
	body="Oshosi Vest +1",
	hands=gear.af2_hands,
	legs="Osh. Trousers +1",
	feet="Osh. Leggings +1",
	}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ring="Eshmun's Ring",
		right_ring="Eshmun's Ring",
	})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {
		head="Malignance Chapeau",
		body=gear.af2_body,
		hands="Kurys Gloves",
		legs="Mummu Kecks +2",
		feet=gear.af2_feet,
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Ethereal Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Solemnity Cape",
	}
		
    sets.idle.PDT = {
		head="Malignance Chapeau",
		body=gear.af2_body,
		hands="Kurys Gloves",
		legs="Mummu Kecks +2",
		feet=gear.af2_feet,
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Ethereal Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Solemnity Cape",
	}
		
    sets.idle.Refresh = {
		head="Malignance Chapeau",
		body=gear.af2_body,
		hands="Kurys Gloves",
		legs="Mummu Kecks +2",
		feet=gear.af2_feet,
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Ethereal Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Solemnity Cape",
	}
    
    -- Defense sets
    sets.defense.PDT = {
		head="Malignance Chapeau",
		body=gear.af2_body,
		hands="Kurys Gloves",
		legs="Mummu Kecks +2",
		feet=gear.af2_feet,
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Ethereal Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Solemnity Cape",
	}

    sets.defense.MDT = {
		head="Malignance Chapeau",
		body=gear.af2_body,
		hands="Kurys Gloves",
		legs="Mummu Kecks +2",
		feet=gear.af2_feet,
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Ethereal Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Solemnity Cape",
	}
    sets.defense.MEVA = {
		head="Malignance Chapeau",
		body=gear.af2_body,
		hands="Kurys Gloves",
		legs="Mummu Kecks +2",
		feet=gear.af2_feet,
		neck="Loricate Torque +1",
		waist="Flume Belt",
		left_ear="Ethereal Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back="Solemnity Cape",
	}

    sets.Kiting = {legs="Carmine Cuisses"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {}

	-- Weapons sets
	sets.weapons.Default = {main=gear.rostam_damage,sub="Nusku Shield",range=gear.fomal,}
	sets.weapons.Leaden = {main=gear.rostam_damage,sub="Nusku Shield",range=gear.dp,}
	sets.weapons.DualWeapons = {main=gear.rostam_damage,sub="Blurred Knife +1",range="Anarchy +2",}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Blurred Knife +1",range="Anarchy +2",}
	sets.weapons.DualLeadenRanged = {main=gear.rostam_damage,sub="Blurred Knife +1",range=gear.dp,}
	sets.weapons.DualLeadenMelee = {main="Naegling",sub="Blurred Knife +1",range=gear.dp,}
	sets.weapons.DualAeolian = {main=gear.rostam_damage,sub="Blurred Knife +1",range="Anarchy +2",}
	sets.weapons.DualLeadenMeleeAcc = {main=gear.rostam_damage,sub=gear.rostam_roll,range=gear.dp,}
	sets.weapons.DualRanged = {main=gear.rostam_damage,sub="Blurred Knife +1",range=gear.fomal,}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head=gear.adhemar_tp_head,
		body=gear.adhemar_tp_body,
		hands=gear.adhemar_tp_hands,
		legs="Mummu Kecks +2",
		feet=gear.herculean_ta_feet,
		neck="Comm. Charm +2",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
    	right_ear="Balder Earring",
    	left_ring="Petrov Ring",
    	right_ring="Ilabrat Ring",
		back=gear.tp_jse_back,
	}
    
    sets.engaged.Acc = {
		head=gear.adhemar_tp_head,
		body=gear.adhemar_tp_body,
		hands=gear.adhemar_tp_hands,
		legs="Mummu Kecks +2",
		feet=gear.herculean_ta_feet,
		neck="Comm. Charm +2",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
    	right_ear="Balder Earring",
    	left_ring="Petrov Ring",
    	right_ring="Ilabrat Ring",
		back=gear.tp_jse_back,
	}

    sets.engaged.DT = {
       head=gear.adhemar_tp_head,
		body=gear.adhemar_tp_body,
		hands=gear.adhemar_tp_hands,
		legs="Mummu Kecks +2",
		feet=gear.herculean_ta_feet,
		neck="Comm. Charm +2",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
    	right_ear="Balder Earring",
    	left_ring="Petrov Ring",
    	right_ring="Ilabrat Ring",
		back=gear.tp_jse_back,
	}
    
    sets.engaged.Acc.DT = {
		head=gear.adhemar_tp_head,
		body=gear.adhemar_tp_body,
		hands=gear.adhemar_tp_hands,
		legs="Mummu Kecks +2",
		feet=gear.herculean_ta_feet,
		neck="Comm. Charm +2",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
    	right_ear="Balder Earring",
    	left_ring="Petrov Ring",
    	right_ring="Ilabrat Ring",
		back=gear.tp_jse_back,
	}

    sets.engaged.DW = {
		head=gear.adhemar_tp_head,
		body=gear.adhemar_tp_body,
		hands=gear.adhemar_tp_hands,
		legs="Mummu Kecks +2",
		feet=gear.herculean_ta_feet,
		neck="Comm. Charm +2",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
    	right_ear="Balder Earring",
    	left_ring="Petrov Ring",
    	right_ring="Ilabrat Ring",
		back=gear.tp_jse_back,
	}

    sets.engaged.DW.Acc = {
		head=gear.adhemar_tp_head,
		body=gear.adhemar_tp_body,
		hands=gear.adhemar_tp_hands,
		legs="Mummu Kecks +2",
		feet=gear.herculean_ta_feet,
		neck="Comm. Charm +2",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
    	right_ear="Balder Earring",
    	left_ring="Petrov Ring",
    	right_ring="Ilabrat Ring",
		back=gear.tp_jse_back,
	}
		
    sets.engaged.DW.DT = {
		head=gear.adhemar_tp_head,
		body=gear.adhemar_tp_body,
		hands=gear.adhemar_tp_hands,
		legs="Mummu Kecks +2",
		feet=gear.herculean_ta_feet,
		neck="Comm. Charm +2",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
    	right_ear="Balder Earring",
    	left_ring="Petrov Ring",
    	right_ring="Ilabrat Ring",
		back=gear.tp_jse_back,
	}
    
    sets.engaged.DW.Acc.DT = {
		head=gear.adhemar_tp_head,
		body=gear.adhemar_tp_body,
		hands=gear.adhemar_tp_hands,
		legs="Mummu Kecks +2",
		feet=gear.herculean_ta_feet,
		neck="Comm. Charm +2",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
    	right_ear="Balder Earring",
    	left_ring="Petrov Ring",
    	right_ring="Ilabrat Ring",
		back=gear.tp_jse_back,
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 11)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 11)
    elseif player.sub_job == 'RNG' then
        set_macro_page(9, 11)
    elseif player.sub_job == 'DRG' then
        set_macro_page(5, 11)
    else
        set_macro_page(10, 11)
    end
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 001')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Sword/Shield
				windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 001')
		else
			windower.chat.input('/lockstyleset 001') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Dagger/Shield
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 001')
		else
			windower.chat.input('/lockstyleset 001') --Catchall just in case something's weird.
		end
	end
end
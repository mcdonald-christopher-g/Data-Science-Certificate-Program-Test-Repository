SELECT * FROM pokemon.pokemon_base_stats;

SELECT HP + Attack + Defense + Special_Attack + Special_Defense + Speed AS BaseTotal, COUNT(pokemon_base_stats.Species) FROM
(SELECT * FROM pokemon_characteristics
WHERE (Category = 'Starter' AND Evolution_Stage = '3rd' AND Species NOT LIKE 'Hisui%' AND Species NOT LIKE 'Ash%')) AS EvolvedStarters
LEFT JOIN
pokemon_base_stats
ON EvolvedStarters.Species = pokemon_base_stats.Species
GROUP BY BaseTotal
ORDER BY BaseTotal;

SELECT Primary_Type, avg(HP), avg(Attack), avg(Defense), avg(Special_Attack), avg(Special_Defense), avg(Speed), avg(HP + Attack) FROM
(SELECT pokemon_base_stats.Species, Primary_Type, HP, Attack, Defense, Special_Attack, Special_Defense, Speed, pokemon_base_stats.Generation FROM 
(SELECT * FROM pokemon.pokemon_characteristics
WHERE (Category = 'Starter' AND Evolution_Stage != 'Mega')
ORDER BY Primary_Type, National_Dex ASC, Generation) AS Starters
LEFT JOIN
pokemon.pokemon_base_stats
ON Starters.Species = pokemon_base_stats.Species) AS by_type
GROUP BY Primary_Type;

SELECT Primary_Type, AVG(HP), AVG(Attack), AVG(Defense), AVG(Special_Attack), AVG(Special_Defense), AVG(Speed), AVG(HP + Attack + Defense + Special_Attack + Special_Defense + Speed) AS 'Avg Total' FROM
(SELECT * FROM pokemon.pokemon_characteristics
WHERE (Category = 'Starter' AND Evolution_Stage = '3rd' AND Species NOT LIKE 'Hisui%' AND Species NOT LIKE 'Ash%')) AS Evolved_Starters
LEFT JOIN
pokemon.pokemon_base_stats
ON Evolved_Starters.Species = pokemon_base_stats.Species
GROUP BY Primary_Type;

SELECT pokemon_base_stats.Generation, AVG(HP), AVG(Attack), AVG(Defense), AVG(Special_Attack), AVG(Special_Defense), AVG(Speed), AVG(HP + Attack + Defense + Special_Attack + Special_Defense + Speed) AS 'Avg Total' FROM
(SELECT * FROM pokemon.pokemon_characteristics
WHERE (Category = 'Starter' AND Evolution_Stage = '3rd' AND Species NOT LIKE 'Hisui%' AND Species NOT LIKE 'Ash%')) AS Evolved_Starters
LEFT JOIN
pokemon.pokemon_base_stats
ON Evolved_Starters.Species = pokemon_base_stats.Species
GROUP BY pokemon_base_stats.Generation;

SELECT pokemon_base_stats.Species, HP , Attack , Defense , Special_Attack , Special_Defense , Speed FROM
(SELECT * FROM pokemon_characteristics
WHERE (Category = 'Starter' AND Species LIKE 'Hisui%')) AS HisuiStarters
LEFT JOIN
pokemon_base_stats
ON HisuiStarters.National_Dex = pokemon_base_stats.National_Dex;
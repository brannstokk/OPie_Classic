local _, T = ...
if T.SkipLocalActionBook then return end
local AB = assert(T.ActionBook:compatible(2, 21), "A compatible version of ActionBook is required.")
local L = AB:locale(true)

local C, z, V = GetLocale(), nil
V = C == "deDE" and {
	"Fähigkeiten", "Auch Gegenstände mit gleichem Namen nutzen", "Kampfhaustier", "Kampfhaustiere", "Eigenes Makro", "Ausrüstungsset", "Ausrüstungssets", "Zusätzlicher Aktionsbutton", "Flugreittier", "Bodenreittier",
	"Gegenstand", "Gegenstände", "Makro", "Makros", "Verschiedenes", "Reittier", "Reittiere", "Neues Makro", "Zeige nur wenn angelegt", "Begleiterfähigkeit",
	"Begleiterfähigkeiten", "Zielmarkierungssymbol", "Weltmarkierung", "Markierungssymbole", "Diesen Abschnitt immer anzeigen", "Zauber", "Spielzeug", "Spielzeuge",
}
or C == "esES" and {
	"Habilidades", "Usar otros artículos con el mismo nombre", "Mascota de duelo", "Mascotas de duelo", "Macro personalizado", "Conjunto de equipamientos", "Conjuntos de equipamientos", "Botón de acción extra", "Montura voladora", "Monutra de tierra",
	"Artículo", "Artículos", "Macro", "Macros", "Misceláneo", "Montura", "Monutras", z, "Mostrar sólo al equipar", z,
	"Habilidades de mascota", "Marcador del mundo", "Marcador del mundo", "Marcadores del mundo", "Mostrar esta rodaja siempre", "Hechizo", "Juegete", z,
}
or C == "esMX" and {
	"Habilidades", "Usar otros artículos con el mismo nombre", "Mascota de duelo", "Mascotas de duelo", "Macro personalizado", "Conjunto de equipamientos", "Conjuntos de equipamientos", "Botón de acción extra", "Montura voladora", "Monutra de tierra",
	"Artículo", "Artículos", "Macro", "Macros", "Misceláneo", "Montura", "Monutras", z, "Mostrar sólo al equipar", z,
	"Habilidades de mascota", "Marcador del mundo", "Marcador del mundo", "Marcadores del mundo", "Mostrar esta rodaja siempre", "Hechizo", "Juegete", z,
}
or C == "frFR" and {
	"Compétences", "Également utiliser l'élément avec le même nom", "Battle Pet", "Battle pets", "Macro personnalisée", "Équipement de Set", "Équipement de sets", "Extra Action Button", "Montures volante", "Monture terrestre",
	"Item", "Items", "Macro", "Macros", "Divers", "Monture", "Montures", "Nouvelle Macro", "Afficher seulement quand équipé", "Compétence du Familier",
	"Compétences du familier", "Marqueur de Raid", "Marqueur de Terrain", "Marqueurs de Raid", "Toujours afficher cette action", "Sort", "Jouet", "Jouets",
}
or C == "koKR" and {
	"능력", "같은 이름의 아이템 사용", "애완동물 대전", "전투 애완동물", "사용자 정의 매크로", "장비 구성", "장비 구성", "추가 행동 버튼", "나는 탈것", "지상 탈것",
	"아이템", "아이템", "매크로", "매크로", "기타", "탈것", "탈것", "새 매크로", "착용 시에만 표시", "소환수 능력",
	"소환수 능력", "공격대 징표", "공격대 위치 표시기", "공격대 징표", "이 조각 항상 표시", "주문", "장난감", "장난감",
}
or C == "ruRU" and {
	"Способности", "Использовать предметы с таким же именем", "Боевой питомец", "Боевые питомцы", "Пользовательские макросы", "Комплект экипировки", "Комплекты экипировки", z, z, "Наземные средства передвижения",
	"Предмет", "Предметы", "Макрос", "Макросы", "Разное", "Средство передвижения", "Средства передвижения", z, "Показывать только если надет", z,
	"Способности питомцев", "Рейдовая метка", z, "Рейдовые метки", "Всегда показывать этот фрагмент", "Заклинание", "Игрушки", z,
}
or C == "zhCN" and {
	"技能", "同样使用具有相同名字的物品", "战宠", "战宠们", "自定义宏", "套装设定", "成套的设备", "额外动作按钮", "飞行坐骑", "陆地坐骑",
	"物品", "物品", "宏", "宏", "杂项", "坐骑", "坐骑", z, "仅在装备时显示", z,
	"宠物技能", "团队标记", "团队世界标记", "团队标记", "始终显示此环", "技能", "玩具", z,
}
or C == "zhTW" and {
	"技能", "同時使用名稱相同的物品", "戰寵", "戰寵", "自訂巨集", "套裝", "套裝", "額外動作按鈕", "飛行坐騎", "地面坐騎",
	"物品", "物品", "巨集", "巨集", "雜項", "坐騎", "坐騎", "新增巨集", "只有裝備在身上時才顯示", "寵物技能",
	"寵物技能", "團隊標記圖示", "團隊世界標記圖示", "團隊標記圖示", "總是顯示這個環的功能", "技能", "玩具", "玩具",
}

local K = V and {"Abilities", "Also use items with the same name", "Custom Macro", "Equipment Set", "Equipment sets", "Extra Action Button", "Ground Mount", "Item", "Items", "Macro", "Macros", "Miscellaneous", "New Macro", "Only show when equipped", "Pet Ability", "Pet abilities", "Raid Marker", "Raid markers", "Show a placeholder when unavailable", "Spell"}
for i=1,K and #K or 0 do
	L[K[i]] = V[i]
end
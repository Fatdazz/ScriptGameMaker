// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function neud(_case, _cout, _heuristique) constructor{
 ptrCase = _case;
 cout = _cout;
 heuristique = _heuristique;
}

function Astar(_obj) constructor{
	n = instance_number(_obj)
	//listCase[n] = pointer_null
	listCase = ds_map_create();
	
	chemin = ds_priority_create();
	for(var i = 0; i < n; i++;){
		listCase[?instance_find(_obj,i)] = new neud(instance_find(_obj,i),infinity,infinity)
		
	}
	
	resetListeCase = function(){
		var key = ds_map_find_first(listCase)
		for(var i = 0; i< n; i++;){
			var current = ds_map_find_value(listCase,key)
			current.heuristique = infinity;
			current.cout = infinity;
			key = ds_map_find_next(listCase,key)
		}
	
	}
	
	//show_debug_message(" map size: " + string(ds_map_size(listCase)))
	//show_debug_message(" map valeur 3 : " + string(instance_find(_obj,1)));
	//show_debug_message(" map 1er valeur  : " + string(listCase[?instance_find(_obj,1)]));

	cheminPlusCourt = function(_neudStart,_neudEnd){
		var neudStart = listCase[?_neudStart]
		var neudEnd = listCase[?_neudEnd]
		var openList = ds_priority_create();		
		var cameFrom = ds_list_create();
		
		neudStart.cout = 0;
		
		ds_priority_add(openList,neudStart,0)
		
		while(!ds_priority_empty(openList)){
		var current	= ds_priority_find_min(openList)
		
		current.ptrCase.image_alpha= 0.5
		
		if(current==neudEnd){
			show_debug_message(" Programme terminer avec SUCCÉ ");
			return true;}
		
		ds_priority_delete_min(openList)
		for(var i = 0; i< 6 ; i++;){
			var neighbor = pointer_null;
			switch (i){
				case 0: neighbor = listCase[?current.ptrCase.top] ; break;
				case 1: neighbor = listCase[?current.ptrCase.topLeft]  ; break;
				case 2: neighbor = listCase[?current.ptrCase.topRight]  ; break;
				case 3: neighbor = listCase[?current.ptrCase.down]      ; break;
				case 4: neighbor = listCase[?current.ptrCase.downLeft] ; break;
				case 5: neighbor = listCase[?current.ptrCase.downRight]  ; break;
				 }
			if(neighbor!=undefined){
				
				var tentative_gScore = current.cout + 1;
				if(tentative_gScore < neighbor.cout){
					
				 neighbor.cout = tentative_gScore;
				 neighbor.heuristique = tentative_gScore + ((point_distance(neighbor.ptrCase.x,neighbor.ptrCase.y,neudEnd.ptrCase.x,neudEnd.ptrCase.y))/(sqrt(3)*124))*3
	
				 if(ds_priority_find_priority(openList,neighbor)==undefined){
					ds_priority_add(openList,neighbor,neighbor.heuristique );
				 }
				 else{
					ds_priority_change_priority(openList,neighbor,neighbor.heuristique);
				 }
				 
				}
				
			
			
			}
		
		}
		
		ds_list_add(cameFrom,current)
		
		}
		
		show_debug_message(" Programme terminer avec ERREUR ")
		return false	
	}
}


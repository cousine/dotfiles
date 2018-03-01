emoji_groups[animal_faces]="
  mouse_face
  cow_face
  tiger_face
  rabbit_face
  cat_face
  dragon_face
  horse_face
  monkey_face
  dog_face
  pig_face
  frog_face
  hamster_face
  wolf_face
  bear_face
"

function random_emoji_animal_face() {
  local group="animal_faces"
  local names
	names=(${=emoji_groups[$group]})
  local list_size=${#names}
  [[ $list_size -eq 0 ]] && return 1
  local random_index=$(( ( RANDOM % $list_size ) + 1 ))
  local name=${names[$random_index]}
  echo ${emoji[$name]}
}

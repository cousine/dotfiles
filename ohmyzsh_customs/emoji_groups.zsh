# mouse_face
# tiger_face
# dragon_face
# horse_face
# pig_face
# frog_face
# wolf_face
# hamster_face
emoji_groups[animal_faces]="
  cow_face
  rabbit_face
  cat_face
  monkey_face
  dog_face
  hamster_face
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

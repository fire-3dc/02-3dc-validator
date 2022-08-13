cat Fox.glb | printf "bytes: %d\n" `wc --bytes` # Get byte count of binary.
./gltfpack -i `pwd`/Fox.glb -o `pwd`/embedded.gltf -te -kn -km -ke -noq
cue import json: embedded.gltf -f # Convert to cue.
cp report_template.cue report.cue # Put text at the start of the file.
cat embedded.cue >> report.cue # Put text at the start of the file.
cue eval report.cue --out json -e "{scenes: scene_count, nodes: node_count, materials: material_count, images: image_count}" # Get report
cue vet report.cue schema: check.cue # Use checks.
cue eval report.cue --out text -e buffers[bufferViews[images[0].bufferView].buffer].uri > uri.txt # Where does this go!?
export FILENAME=$(cue eval report.cue --out text -e buffers[bufferViews[images[0].bufferView].buffer].uri)
export OFFSET=$(cue eval report.cue -e bufferViews[images[0].bufferView].byteOffset)
export LENGTH=$(cue eval report.cue -e buffers[bufferViews[images[0].bufferView].buffer].byteLength)
# apt install -y graphicsmagick
cat $FILENAME | tail -c+$OFFSET | head -c$LENGTH | gm identify -format "{ width: %w, height: %h }" -
cue eval report.cue -e "{mesh_0_primitive_0_index_count: accessors[meshes[0].primitives[0].indices].count }" # If the type is a triangle mesh it
cue eval report.cue -e "{mesh_0_primitive_0_triangle_count_if_trimesh: accessors[meshes[0].primitives[0].indices].count / 3 }" # If the type is a triangle mesh
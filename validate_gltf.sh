cat Fox.glb | wc --bytes # Get byte count of binary.
blender --background --python-expr "import bpy; bpy.ops.import_scene.gltf(filepath='`pwd`/Fox.glb', import_pack_images=True, merge_vertices=True, import_shading='NORMALS', bone_heuristic='BLENDER', guess_original_bind_pose=True); bpy.ops.export_scene.gltf(filepath='`pwd`/embedded.gltf', export_format='GLTF_EMBEDDED')" # Export embedded json.
cue import json: embedded.gltf -f # Convert to cue.
cp report_template.cue report.cue # Put text at the start of the file.
cat embedded.cue >> report.cue # Put text at the start of the file.
cue vet report.cue schema: check.cue # Use checks.
cue eval report.cue -e "{scenes: scene_count, nodes: node_count, materials: material_count}" # Get report
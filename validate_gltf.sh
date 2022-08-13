cat Fox.glb | wc --bytes
blender --background --python-expr "import bpy; bpy.ops.import_scene.gltf(filepath='`pwd`/Fox.glb', import_pack_images=True, merge_vertices=True, import_shading='NORMALS', bone_heuristic='BLENDER', guess_original_bind_pose=True); bpy.ops.export_scene.gltf(filepath='`pwd`/embedded.gltf', export_format='GLTF_EMBEDDED')"
cue import json: embedded.gltf -f
cp report_template.cue report.cue
cat embedded.cue >> report.cue
cue vet report.cue schema: check.cue
cue eval report.cue -e scene_length
cue eval report.cue -e node_length
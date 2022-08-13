cd schemas/gltf/2.0/schema/
cue import \
extras.schema.json \
extension.schema.json \
glTFProperty.schema.json \
glTFChildOfRootProperty.schema.json \
accessor.schema.json \
accessor.sparse.indices.schema.json \
accessor.sparse.schema.json \
accessor.sparse.values.schema.json \
animation.channel.schema.json \
animation.channel.target.schema.json \
animation.sampler.schema.json \
animation.schema.json \
asset.schema.json \
buffer.schema.json \
bufferView.schema.json \
camera.orthographic.schema.json \
camera.perspective.schema.json \
camera.schema.json \
glTFid.schema.json \
glTF.schema.json \
image.schema.json \
material.normalTextureInfo.schema.json \
material.occlusionTextureInfo.schema.json \
material.pbrMetallicRoughness.schema.json \
material.schema.json \
mesh.primitive.schema.json \
mesh.schema.json \
node.schema.json \
sampler.schema.json \
scene.schema.json \
skin.schema.json \
textureInfo.schema.json \
texture.schema.json

# cue eval jsonschema: gltf.schema.json json: Fox.gltf
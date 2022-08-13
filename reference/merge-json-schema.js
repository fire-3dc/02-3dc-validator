// json-schema-ref-parser

const fs = require('fs');
// Fetch the gltf 2.0 specification schema folder
const $RefParser = require("@apidevtools/json-schema-ref-parser");  
const process = require('process');
process.chdir('schemas/gltf/2.0/schema/');


async function bundle() {
    let schema = await $RefParser.bundle('glTF.schema.json');
    console.log(JSON.stringify(schema));
}

bundle();
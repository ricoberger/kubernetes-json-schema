# openapi2jsonschema

A utility to extract [JSON Schema](http://json-schema.org/) from a valid
[OpenAPI](https://www.openapis.org/) specification.

> This is a modified version of
> [yannh/openapi2jsonschema](https://github.com/yannh/openapi2jsonschema) and
> [instrumenta/openapi2jsonschema](https://github.com/instrumenta/openapi2jsonschema)

## Why

OpenAPI contains a list of type `definitions` using a superset of JSON Schema.
These are used internally by various OpenAPI compatible tools. I found myself
however wanting to use those schemas separately, outside existing OpenAPI
tooling. Generating separate schemas for types defined in OpenAPI allows for all
sorts of indepent tooling to be build which can be easily maintained, because
the canonical definition is shared.

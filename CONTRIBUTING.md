# Contributing

## Rebuilding Models

The models in this library are generated using `json_serializable`. If you make changes to the models, you can rebuild the generated code using the following command:

```bash
dart run build_runner build
dart format lib/src/**/*.g.dart
```

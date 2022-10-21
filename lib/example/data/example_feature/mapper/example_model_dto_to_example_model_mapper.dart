import 'package:injectable/injectable.dart';
import 'package:testproject/example/data/example_feature/model/example_model_dto.dart';
import 'package:testproject/example/domain/example_feature/model/example_model.dart';

@injectable
class ExampleModelDtoToExampleModelMapper {
  ExampleModel call(ExampleModelDto dto) => ExampleModel();
}
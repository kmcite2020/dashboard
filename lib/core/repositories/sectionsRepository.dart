// ignore_for_file: file_names
import 'package:states_rebuilder/scr/development_booster/development_booster.dart';

class SectionsRepo implements I {}

class StatesBuilderTodosRepository implements ITodosRepository {
  final core.TodosRepository _todosRepository;

  StatesBuilderTodosRepository({core.TodosRepository todosRepository}) : _todosRepository = todosRepository;

  @override
  Future<List<Todo>> loadTodos() async {
    try {
      final todoEntities = await _todosRepository.loadTodos();
      var todos = <Todo>[];
      for (var todoEntity in todoEntities) {
        todos.add(
          Todo.fromJson(todoEntity.toJson()),
        );
      }
      return todos;
    } catch (e) {
      throw PersistanceException('There is a problem in loading todos : $e');
    }
  }

  @override
  Future saveTodos(List<Todo> todos) {
    try {
      var todosEntities = <TodoEntity>[];
      for (var todo in todos) {
        todosEntities.add(TodoEntity.fromJson(todo.toJson()));
      }

      return _todosRepository.saveTodos(todosEntities);
    } catch (e) {
      throw PersistanceException('There is a problem in saving todos : $e');
    }
  }
}

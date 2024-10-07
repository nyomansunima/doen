abstract class BaseService<E> {
  Future<E> read(String id);
  Stream<E> stream(String id);
  Future<List<E>> readAll();
  Stream<List<E>> streamAll();
  Future<void> delete(String id);
  Future<void> deleteAll();
  Future<void> create(E entity);
  Future<void> update(E entity, String id);
}

package br.com.ifpe.viajalheira.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/*@author Maria Beatriz Germano 
 * 
 *Classe responsável pelas ações referentes ao CRUD de IdiomaUsuario
 */
public class IdiomaUsuarioDao {

	
	private static final String PERSISTENCE_UNIT = "viajalheira";

	public void salvar(IdiomaUsuario idiomaUsuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(idiomaUsuario);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public List<IdiomaUsuario> listar() {

		return listar(null);
	}

	public List<IdiomaUsuario> listar(IdiomaUsuario idiomaUsuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		int usuario = idiomaUsuario != null ? idiomaUsuario.getUsuario().getId() : 0;
		if (usuario > 0) {
			query = manager.createQuery("FROM IdiomaUsuario WHERE usuario.id LIKE :paramUsuario ORDER BY id");
			query.setParameter("paramUsuario", usuario);
		} 
		
		
		List<IdiomaUsuario> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}

	public IdiomaUsuario buscarPorId(int id) {
		IdiomaUsuario obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(IdiomaUsuario.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(IdiomaUsuario idiomaUsuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(idiomaUsuario);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	
}

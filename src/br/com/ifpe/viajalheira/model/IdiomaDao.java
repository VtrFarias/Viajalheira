package br.com.ifpe.viajalheira.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/*@author Maria Beatriz Germano 
 * 
 *Classe responsável pelas ações referentes ao CRUD de Idioma 
 */
public class IdiomaDao {

	private static final String PERSISTENCE_UNIT = "viajalheira";

	public void salvar(Idioma idioma) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(idioma);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public List<Idioma> listar() {

		return listar(null);
	}

	public List<Idioma> listar(Idioma idioma) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		String descricao = idioma != null ? idioma.getDescricao(): "";
		if (descricao != null && !descricao.equals("")) {
			query = manager.createQuery("FROM Idioma WHERE descricao LIKE :paramDescricao ORDER BY id");
			query.setParameter("paramDescricao", descricao);
		} else {
			query = manager.createQuery("FROM Idioma ORDER BY id");
		}
		
		List<Idioma> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}

	public Idioma buscarPorId(int id) {
		Idioma obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Idioma.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(Idioma idioma) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(idioma);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	
}

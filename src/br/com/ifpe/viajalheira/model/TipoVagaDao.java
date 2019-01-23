package br.com.ifpe.viajalheira.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/*@author Maria Beatriz Germano 
 * 
 *Classe responsável pelas ações referentes ao CRUD de Tipo de Vaga 
 */
public class TipoVagaDao {

	private static final String PERSISTENCE_UNIT = "viajalheira";

	public void salvar(TipoVaga tipoVaga) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(tipoVaga);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public List<TipoVaga> listar() {

		return listar(null);
	}

	public List<TipoVaga> listar(TipoVaga tipoVaga) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		String descricao = tipoVaga != null ? tipoVaga.getDescricao(): "";
		if (descricao != null && !descricao.equals("")) {
			query = manager.createQuery("FROM TipoVaga WHERE descricao LIKE :paramDescricao ORDER BY id");
			query.setParameter("paramDescricao", descricao);
		} else {
			query = manager.createQuery("FROM TipoVaga ORDER BY id");
		}
		
		List<TipoVaga> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}

	public TipoVaga buscarPorId(int id) {
		TipoVaga obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(TipoVaga.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(TipoVaga tipoVaga) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(tipoVaga);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
}

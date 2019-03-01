package br.com.ifpe.viajalheira.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ImagensDao {


	private static final String PERSISTENCE_UNIT = "viajalheira";

	public void salvar(Imagens imagem) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(imagem);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public List<Imagens> listar() {

		return listar(null);
	}

	public List<Imagens> listar(Imagens imagem) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		String descricao = imagem != null ? imagem.getDescricao(): "";
		if (descricao != null && !descricao.equals("")) {
			query = manager.createQuery("FROM Imagens WHERE descricao LIKE :paramDescricao ORDER BY id");
			query.setParameter("paramDescricao", descricao);
		} else {
			query = manager.createQuery("FROM Imagens ORDER BY id");
		}
		
		List<Imagens> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}
	public Imagens buscarPorId(int id) {
		Imagens obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Imagens.class, id);
		manager.close();
		factory.close();
		return obj;
		}

	public List<Imagens> buscarPorIdd(int id) {
		List <Imagens> obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("FROM Imagens WHERE vaga.id LIKE :paramID ORDER BY id");
		query.setParameter("paramID", id);
		obj =  query.getResultList();
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(Imagens imagem) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(imagem);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	
}

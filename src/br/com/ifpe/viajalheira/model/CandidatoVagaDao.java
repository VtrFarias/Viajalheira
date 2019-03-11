package br.com.ifpe.viajalheira.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class CandidatoVagaDao {

	private static final String PERSISTENCE_UNIT = "viajalheira";

	public void salvar(CandidatoVaga candidatoVaga) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(candidatoVaga);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	/*
	public List<CandidatoVaga> listar() {

		return listar(null);
	}

	  public List<CandidatoVaga> listar(CandidatoVaga candidatoVaga) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		int usuario = candidatoVaga != null ? candidatoVaga.getUsuario().getId() : 0;
		int dono = candidatoVaga != null ? candidatoVaga.getVagaHospedagem().getUsuario().getId() : 0;
		char situacao = candidatoVaga != null ? candidatoVaga.getSituacao() : ' ';

		if (situacao != ' ' && usuario != 0) {
			query = manager
					.createQuery("FROM CandidatoVaga WHERE situacao LIKE :paramSituacao AND usuario.id LIKE :paramUsuario ORDER BY id");
			query.setParameter("paramSituacao", "%" + situacao + "%");
			query.setParameter("paramUsuario", "%" + usuario + "%");
		} else if (situacao != ' ' && usuario == 0) {
			query = manager.createQuery("FROM CandidatoVaga WHERE situacao LIKE :paramSituacao ORDER BY id");
			query.setParameter("paramSituacao", "%" + situacao + "%");
		} else if (situacao == ' ' && usuario != 0) {
			query = manager.createQuery("FROM CadidatoVaga WHERE usuario.id LIKE :paramUsuario ORDER BY id");
			query.setParameter("paramSituacao", "%" + situacao + "%");
		} else if (dono != 0 && situacao == ' ' && usuario == 0) {
			query = manager.createQuery("FROM CandidatoVaga WHERE vaga.usuario.id LIKE :paramDono ORDER BY id");
			query.setParameter("paramDono", "%" + dono + "%");
		} else {
			query = manager.createQuery("FROM CandidatoVaga WHERE situacao NOT LIKE :paramSituacao ORDER BY id");
			query.setParameter("paramSituacao", '0');
		}

		List<CandidatoVaga> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}*/

	public List<CandidatoVaga> listarAplicadas(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		

		query = manager.createQuery("FROM CandidatoVaga WHERE usuario.id LIKE :paramUsuario AND situacao NOT LIKE :paramSituacao ORDER BY id");
		query.setParameter("paramUsuario", id);
		query.setParameter("paramSituacao", '0');

		List<CandidatoVaga> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}

	public List<CandidatoVaga> listaRecebidas(int id) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;

		query = manager.createQuery("FROM CandidatoVaga WHERE vagaHospedagem.usuario.id LIKE :paramDono AND situacao NOT LIKE :paramSituacao ORDER BY id");
		query.setParameter("paramDono", id);
		query.setParameter("paramSituacao", '0');

		List<CandidatoVaga> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}

	public CandidatoVaga buscarPorId(int id) {
		CandidatoVaga obj = null;
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(CandidatoVaga.class, id);
		manager.close();
		factory.close();
		return obj;
	}

	public void alterar(CandidatoVaga candidatoVaga) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(candidatoVaga);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

}

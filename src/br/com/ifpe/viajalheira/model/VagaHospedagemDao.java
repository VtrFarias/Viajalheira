package br.com.ifpe.viajalheira.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class VagaHospedagemDao {


	private static final String PERSISTENCE_UNIT = "viajalheira";

	public void salvar(VagaHospedagem vaga) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(vaga);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public List<VagaHospedagem> listar() {

		return listar(null);
	}

	public List<VagaHospedagem> listar(VagaHospedagem vaga) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		String titulo = vaga != null ? vaga.getTitulo(): "";
		String tipoVaga = vaga != null ? vaga.getTipoVaga().getDescricao(): "";
		
		if (!titulo.equals("") && tipoVaga.equals("")) {
			query = manager.createQuery("FROM VagaHospedagem WHERE titulo LIKE :paramTitulo AND situacao NOT LIKE :paramSituacao ORDER BY descricao");
			query.setParameter("paramTitulo", "%" + titulo + "%");
			query.setParameter("paramSituacao",String.valueOf('0'));
			} else if (titulo.equals("") && !tipoVaga.equals("")) {
			query = manager.createQuery("FROM VagaHospedagem WHERE tipoVaga.descricao LIKE :paramDescricao AND situacao NOT LIKE :paramSituacao ORDER BY id");
			query.setParameter("paramDescricao", "%" + tipoVaga + "%");
			query.setParameter("paramSituacao",String.valueOf('0'));
			} else if (!titulo.equals("") && !tipoVaga.equals("")) {
			query = manager.createQuery(
			"FROM VagaHospedagem WHERE titulo LIKE :paramTitulo AND tipoVaga.descricao LIKE :paramDescricao AND situacao NOT LIKE :paramSituacao ORDER BY id");
			query.setParameter("paramTitulo", "%" + titulo + "%");
			query.setParameter("paramDescricao", "%" + tipoVaga + "%");
			query.setParameter("paramSituacao",String.valueOf('0'));
			} else {
			query = manager.createQuery("FROM VagaHospedagem WHERE situacao NOT LIKE :paramSituacao ORDER BY id");

			query.setParameter("paramSituacao",String.valueOf('0'));
			}
		List<VagaHospedagem> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}

	public VagaHospedagem buscarPorId(int id) {
		VagaHospedagem obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(VagaHospedagem.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(VagaHospedagem vaga) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(vaga);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	
	
}

package br.com.ifpe.viajalheira.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/*@author Maria Beatriz Germano 
 * 
 * Classe responsável pelas ações referentes ao CRUD de usuário
 * */
public class UsuarioDao {


	private static final String PERSISTENCE_UNIT = "viajalheira";

	public void salvar(Usuario usuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(usuario);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public List<Usuario> listar() {

		return listar("");
	}

	public List<Usuario> listar(String nome) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		
		if (nome != null && !nome.equals("")) {
			query = manager.createQuery("FROM Usuario WHERE nome LIKE :paramNome ORDER BY id");
			query.setParameter("paramNome", "%" + nome + "%");
		} else {
			query = manager.createQuery("FROM Usuario ORDER BY id");
		}
		List<Usuario> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}

	public Usuario buscarPorId(int id) {
		Usuario obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Usuario.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(Usuario usuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(usuario);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	
	public Usuario buscarUsuario(Usuario usuario) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("FROM Usuario WHERE email LIKE :paramEmail AND senha LIKE :paramSenha");
		query.setParameter("paramEmail", usuario.getEmail());
		query.setParameter("paramSenha", usuario.getSenha());
		List<Usuario> registros = query.getResultList();
		Usuario obj = null;
		if (!registros.isEmpty()) {
			obj = (Usuario) registros.get(0);
		}
		manager.close();
		factory.close();
		return obj;
	}
}

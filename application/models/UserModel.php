<?php
class UserModel extends CI_Model
{
    public function getUserByUsername($username)
    {
        $user = $this->db->where('username', $username)
            ->get('users')
            ->row_array();
        return $user;
    }

    public function getAllUsers($limit = 10, $offset = 0, $username = '', $role = '')
    {
        if (!empty($username)) {
            $this->db->like('username', $username);
        }
        if (!empty($role)) {
            $this->db->where('role', $role);
        }

        $users = $this->db->get('users', $limit, $offset)
            ->result();
        return $users;
    }

    public function getUser($id)
    {
        $user = $this->db->get_where('users', ['id' => $id])
            ->row();
        return $user;
    }

    public function countAllUsers($username = '', $role = '')
    {
        if (!empty($username)) {
            $this->db->like('username', $username);
        }
        if (!empty($role)) {
            $this->db->where('role', $role);
        }

        return $this->db->count_all_results('users');
    }

    public function createUser($data)
    {
        $createUser = $this->db->insert('users', $data);
        return $createUser;
    }

    public function updateUser($id, $data)
    {
        $updateUser = $this->db->update('users', $data, ['id' => $id]);
        return $updateUser;
    }

    public function deleteUser($id)
    {
        $deleteUser = $this->db->delete('users', ['id' => $id]);
        return $deleteUser;
    }
}

#ifndef _MESH_H_
#define _MESH_H_

#include <rply.h>
#include <stdbool.h>
#include <GL/gl.h>

typedef struct Vertex {
	GLfloat x, y, z;
} Vertex;

typedef Vertex Normal;

typedef struct TexCoord {
	GLfloat u, v;
} TexCoord;

typedef struct Triangle {
	GLuint vertex[3];
} Triangle ;

typedef struct Mesh {
	char *name;

	int num_vertices;
	Vertex *vertex;
	GLuint vertex_vbo;

	int num_normals;
	Normal *normal;
	GLuint normal_vbo;
#if 0 /* TODO: Textures :p */
	int num_texcoords;
	TexCoord *texcoord;
	GLuint texcoord_vbo;
#endif
	int num_triangles;
	Triangle *triangle;
	GLuint triangle_vbo;
} Mesh;

Mesh *mesh_import(const char *filename);

void mesh_upload_to_gpu(Mesh *mesh, GLuint program);
#endif

# Multi-Tenant Helpdesk

This is a monorepo for a multi-tenant helpdesk application.

## Architecture

```
[User] -> [Botpress] -> [RAG FastAPI] -> [LLM Gateway] -> [Tool Registry]
                                      ^
                                      |
                               [Ingestion Workers]
                                      ^
                                      |
                               [Qdrant/Elastic]
                                      ^
                                      |
                                  [Postgres]
                                      ^
                                      |
                                    [Redis]
```

## Components

* **Botpress:** User-facing chatbot interface.
* **RAG FastAPI:** Retrieval-Augmented Generation FastAPI service for question answering.
* **LLM Gateway:** A gateway to interact with Large Language Models.
* **Tool Registry:** A registry for available tools that the LLM can use.
* **Ingestion Workers:** Workers to ingest and process data.
* **Qdrant/Elastic:** Vector database for semantic search.
* **Postgres:** Relational database for storing structured data.
* **Redis:** In-memory data store for caching and session management.
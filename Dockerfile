FROM python:3.13-slim

WORKDIR /app

# Install uv for dependency management
RUN pip install uv

COPY . ./

RUN uv pip install --system -e .
RUN chmod +x entrypoint.py

ENV PYTHONPATH=/app/src:$PYTHONPATH
ENV MCP_TRANSPORT=http
ENV PORT=8080

EXPOSE 8080

ENTRYPOINT ["uv", "run", "./entrypoint.py"]

# 使用官方 TensorFlow 镜像（含 GPU 支持）
FROM tensorflow/serving:2.11.0-gpu

# 设置模型路径
ENV MODEL_NAME=esmm
ENV MODEL_BASE_PATH=/models

# 暴露端口（默认 8500 用于 gRPC，8501 用于 REST API）
EXPOSE 8500 8501

# 拷贝模型文件到镜像中
COPY models/ /models/
COPY models.config /models/models.config

# 启动服务（使用配置文件）
CMD ["--model_config_file=/models/models.config"]

sudo docker stop tf-serving && sudo docker rm tf-serving

# 启动容器（挂载模型目录和 GPU）

docker run -d \
  --name tf-serving \
  --restart unless-stopped \
   -e TF_CPP_MIN_LOG_LEVEL=0 \
  -e TF_CPP_VMODULE=* \
  -e TF_CPP_LOG_THREAD_ID=1 \
  -e TF_CPP_LOG_TIMESTAMP=1 \
   -v /data/iflyweb/ddzhang6/tf-gpu/models:/models \
  -v $(pwd)/models.config:/models/models.config \
  -p 8500:8500 -p 8501:8501 \
  --gpus 'device=1' \
  -e 'TF_FORCE_GPU_ALLOW_GROWTH=true'  \
  -e 'TF_GPU_MEMORY_FRACTION=0.5' \
  -e 'TF_CPP_GPU_THREAD_COUNT=8' \
  -e 'TF_CPP_GPU_THREAD_MODE=gpu_private' \
  -e 'TF_CPP_GPU_THREAD_POOL_SIZE=8' \
  -e 'TF_CPP_INTRA_OP_PARALLELISM_THREADS=8' \
  -e 'TF_CPP_INTER_OP_PARALLELISM_THREADS=8' \
  -e 'TF_CPP_USE_PARALLEL_OPENMP=true' \
  -e 'OMP_NUM_THREADS=8' \
  -e 'MKL_NUM_THREADS=8' \
  -e 'TF_SERVING_MAX_REQUEST_SIZE=104857600' \
  -e 'TF_SERVING_MAX_RESPONSE_SIZE=104857600' \
  -e 'TF_SERVING_MAX_BATCH_SIZE=256' \
  -e 'TF_SERVING_BATCH_TIMEOUT_MICROS=1000' \
  tensorflow-serving-gpu


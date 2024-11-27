from llama_cpp import Llama

from globals import llm


def load_llm(llm_path, context_length, gpu_layers):

    global llm
    llm = Llama(model_path=llm_path, n_ctx=context_length, n_gpu_layers=gpu_layers)
  

def llm_response(sys_prompt, user_prompt):
    while True:
        response = llm.create_chat_completion(
            messages=[{'role': 'system', 'content': sys_prompt},
                      {'role': 'user', 'content': user_prompt}],
            max_tokens=None
        )
        if response['choices'][0]['finish_reason'] == 'stop':
            break
    return response['choices'][0]['message']['content']
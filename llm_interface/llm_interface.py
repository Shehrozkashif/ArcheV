from llama_cpp import Llama


def llm_response(llm_obj, sys_prompt, user_prompt):
    while True:
        response = llm_obj.create_chat_completion(
            messages=[{'role': 'system', 'content': sys_prompt},
                      {'role': 'user', 'content': user_prompt}],
            max_tokens=None
        )
        if response['choices'][0]['finish_reason'] == 'stop':
            break
    return response['choices'][0]['message']['content']


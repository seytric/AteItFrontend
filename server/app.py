from flask import Flask, jsonify, request
import openai

app = Flask(__name__)
openai.api_key = "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"

@app.route('/gpt3', methods=['POST'])
def gpt3_response():
    data = request.get_json()
    print(data)
    prompt = data['prompt']
    completions = openai.Completion.create(
        engine="text-davinci-002",
        prompt=prompt,
        max_tokens=1024,
        n=1,
        stop=None,
        temperature=0.5,
    )
    response = {
        "response": completions.choices[0].text.strip()
    }

    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True)

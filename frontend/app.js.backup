async function loadApplicationData() {

    try {

        const healthResponse = await fetch(
            "http://localhost:5000/health"
        );

        const healthData = await healthResponse.json();

        document.getElementById("status").innerText =
            "Application Status: " + healthData.status;


        const messageResponse = await fetch(
            "http://localhost:5000/api/message"
        );

        const messageData = await messageResponse.json();

        document.getElementById("message").innerText =
            "Message: " + messageData.message;

        document.getElementById("environment").innerText =
            "Environment: " + messageData.environment;

    } catch (error) {

        document.getElementById("status").innerText =
            "Application Status: DOWN";

        console.error(error);
    }
}

loadApplicationData();

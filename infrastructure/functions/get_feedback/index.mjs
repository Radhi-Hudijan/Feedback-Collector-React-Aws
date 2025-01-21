import AWS from "aws-sdk";

const dynamoDB = new AWS.DynamoDB.DocumentClient();

export const handler = async (event) => {
    try {
        const tableName = process.env.TABLE_NAME; // Get the table name from the environment variable
        const feedbackId = event.queryStringParameters?.id; // Get the 'id' from query parameters, if provided

        if (feedbackId) {
            // Fetch a specific feedback by ID
            const params = {
                TableName: tableName,
                Key: { id: feedbackId },
            };

            const result = await dynamoDB.get(params).promise();

            if (!result.Item) {
                return {
                    statusCode: 404,
                    body: JSON.stringify({ message: "Feedback not found" }),
                };
            }

            return {
                statusCode: 200,
                body: JSON.stringify(result.Item),
            };
        } else {
            // Fetch all feedbacks
            const params = {
                TableName: tableName,
            };

            const result = await dynamoDB.scan(params).promise();

            return {
                statusCode: 200,
                body: JSON.stringify(result.Items),
            };
        }
    } catch (error) {
        console.error("Error fetching feedback:", error);
        return {
            statusCode: 500,
            body: JSON.stringify({ message: "Internal server error", error }),
        };
    }
};

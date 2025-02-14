import AWS from "aws-sdk";

const dynamoDB = new AWS.DynamoDB.DocumentClient();

export const handler = async (event) => {
    try {
        console.log("Received event:", JSON.stringify(event, null, 2));

        const tableName = process.env.TABLE_NAME;

        const feedbackId = event.queryStringParameters?.id;
        const feedback = event.queryStringParameters?.feedback;
        if (!feedbackId) {
            return {
                statusCode: 400,
                body: JSON.stringify({ message: "Missing required parameter: id" }),
            };
        }

        const params = {
            TableName: tableName,
            Key: { feedback_id: feedbackId },
            ExpressionAttributeNames: { "#feedback": "feedback" },
            ExpressionAttributeValues: { ":feedback": feedback },
            UpdateExpression: "SET #feedback = :feedback",
            ReturnValues: "ALL_NEW",
            ConditionExpression: "attribute_exists(feedback_id)",
        };
        const result = await dynamoDB.update(params).promise();

        return {
            statusCode: 200,
            body: JSON.stringify({ message: "Feedback updated successfully", result }),
        };
    } catch (error) {

        return {
            statusCode: 400,
            body: JSON.stringify({ message: "Invalide Feedback_id" }),
        };
    }
};

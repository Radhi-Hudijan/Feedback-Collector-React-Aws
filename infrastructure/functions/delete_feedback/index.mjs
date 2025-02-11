import AWS from "aws-sdk";

const dynamoDB = new AWS.DynamoDB.DocumentClient();

export const handler = async (event) => {
    try {
        console.log("Received event:", JSON.stringify(event, null, 2));

        const tableName = process.env.TABLE_NAME;

        const feedbackId = event.queryStringParameters?.id;
        if (!feedbackId) {
            return {
                statusCode: 400,
                body: JSON.stringify({ message: "Missing required parameter: id" }),
            };
        }

        const params = {
            TableName: tableName,
            Key: { feedback_id: feedbackId },
            ReturnValues: "ALL_OLD",
            ConditionExpression: "attribute_exists(feedback_id)",
        };
        const result = await dynamoDB.delete(params).promise();

        return {
            statusCode: 200,
            body: JSON.stringify({ message: "Feedback deleted successfully", result }),
        };
    } catch (error) {

        return {
            statusCode: 500,
            body: JSON.stringify({ message: "Internal server error", error: error.message }),
        };
    }
};

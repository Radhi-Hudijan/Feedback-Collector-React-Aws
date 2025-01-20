import pkg from 'aws-sdk';
const { DynamoDB } = pkg;
import { v4 as uuidv4 } from 'uuid';

const dynamodb = new DynamoDB.DocumentClient();
const { TABLE_NAME } = process.env;


export const handler = async (event) => {
    try {
        // Parse the request body
        const body = JSON.parse(event.body);

        // Generate a unique ID for the feedback
        const feedback_id = uuidv4();

        // DynamoDB Item
        const item = {
            feedback_id: feedback_id,
            feedback: body.feedback,
            User_ID: body.user_id,
            Timestamp: new Date().toISOString(),
        };

        // Save the feedback to DynamoDB
        await dynamodb
            .put({
                TableName: TABLE_NAME,
                Item: item,
            })
            .promise();

        // Return a successful response
        return {
            statusCode: 200,
            body: JSON.stringify({
                message: 'Feedback saved successfully!',
                id: feedback_id,
            }),
        };
    } catch (error) {
        console.error('Error saving feedback:', error);

        // Return an error response
        return {
            statusCode: 500,
            body: JSON.stringify({
                message: 'Failed to save feedback',
                error: error.message,
            }),
        };
    }
};

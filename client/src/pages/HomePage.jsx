import Header from "../components/Header";
import Footer from "../components/Footer";

const feedbackData = [
  { name: "John Doe", email: "john@example.com", feedback: "Great service!" },
  { name: "Jane Smith", email: "jane@example.com", feedback: "Very helpful." },
  // Add more feedback objects here
];

function HomePage() {
  return (
    <div className="min-h-screen flex flex-col justify-between bg-gray-100">
      <Header />
      <main className="flex-grow flex items-center justify-center">
        <div className="bg-white p-8 rounded shadow-md w-full max-w-2xl">
          <h2 className="text-2xl font-bold mb-6 text-center">Feedback</h2>
          {feedbackData.map((feedback, index) => (
            <div key={index} className="mb-4 p-4 border-b">
              <h3 className="text-xl font-semibold">{feedback.name}</h3>
              <p className="text-gray-600">{feedback.email}</p>
              <p className="mt-2">{feedback.feedback}</p>
            </div>
          ))}
        </div>
      </main>

      <Footer />
    </div>
  );
}

export default HomePage;

const {MongoClient} = require("mongodb");
const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");

const app = express();
const port = process.env.PORT || 3000;
const url = process.env.MONGODB_URL;
const dbName = "DevOpsAssignment";

const client = new MongoClient(url, {useNewUrlParser: true, useUnifiedTopology: true}); // Use new URL parser and unified topology for MongoClient

app.use(cors());
app.use(bodyParser.json());

async function connectToDatabase() {
    await client.connect();
    console.log("Connected to MongoDB");

    const db = client.db(dbName);
    return {
        counterCollection: db.collection("counters"),
        orderCollection: db.collection("orders"),
    };
}

async function initializeCounters(counterCollection) {
    await counterCollection.updateOne(
        {_id: "orderSeq"},
        {$setOnInsert: {seq: 1}},
        {upsert: true}
    );
    console.log("Prepared MongoDB");
}

async function main() {
    const {counterCollection, orderCollection} = await connectToDatabase();
    await initializeCounters(counterCollection);

    app.get("/orders", async (req, res) => {
        const orders = await orderCollection.find({}).toArray();
        res.json(orders);
    });

    app.delete("/orders/:id", async (req, res) => {
        await orderCollection.deleteOne({_id: Number(req.params.id)});
        res.send(`Order number ${req.params.id} deleted successfully.`);
    });

    app.post("/orders", async (req, res) => {
        const orderSeq = await counterCollection.findOneAndUpdate(
            {_id: "orderSeq"},
            {$inc: {seq: 1}},
            {returnOriginal: false} // Returns the document after update
        );

        await orderCollection.insertOne({
            _id: orderSeq.seq,
        });

        res.send(`Order number ${orderSeq.seq} created successfully.`);
    });

    app.listen(port, () => {
        console.log(`DevOps assignment app listening on port ${port}`);
    });
}

main().catch(err => console.error("Failed to start the server:", err));
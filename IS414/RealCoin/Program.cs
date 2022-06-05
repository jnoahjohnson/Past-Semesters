using System;
using Newtonsoft.Json;
using EllipticCurve;


namespace RealCoin
{
    class Program
    {
        static void Main(string[] args)
        {
            PrivateKey key1 = new PrivateKey();
            PublicKey wallet1 = key1.publicKey();

            PrivateKey key2 = new PrivateKey();
            PublicKey wallet2 = key2.publicKey();

            Blockchain realcoin = new Blockchain(2, 100);

            Console.WriteLine("Start the Miner.");
            realcoin.MinePendingTransactions(wallet1);
            Console.WriteLine("\nBalance of wallet 1 is: $" + realcoin.GetBalanceOfWallet(wallet1));

            Transaction tx1 = new Transaction(wallet1, wallet2, 10);
            tx1.SignTransaction(key1);
            realcoin.addPendingTransaction(tx1);

            Console.WriteLine(realcoin.PendingTransactions.ToString());

            Console.WriteLine("Start the Miner.");
            realcoin.MinePendingTransactions(wallet2);

            Console.WriteLine("\nBalance of wallet 1 is: $" + realcoin.GetBalanceOfWallet(wallet1));
            Console.WriteLine("\nBalance of wallet 2 is: $" + realcoin.GetBalanceOfWallet(wallet2));

            string blockJSON = JsonConvert.SerializeObject(realcoin, Formatting.Indented);
            Console.WriteLine(blockJSON);

            // realcoin.GetLatestBlock().PreviousHash = "123456";

            if (realcoin.IsChainValid())
            {
                Console.WriteLine("Blockchain is Valid!!!");
            }
            else
            {
                Console.WriteLine("Blockchain is not valid!!!");
            }
        }
    }
}

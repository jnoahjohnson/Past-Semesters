using System;
using System.Security.Cryptography;
using System.Text;

namespace Merkle
{
    class Program
    {
        static void Main(string[] args)
        {
            // Text to start with
            string tx1Hash = "aad28e85f31ae79339b49d114d7c1811d2c667681a1904ebbc326842a0a81985";
            string tx2Hash = "b963d3426088217357b146d5600817c54f93c2ea1a23126988e36460015ffc0e";
            string tx3Hash = "82498f4da1e1b662b02e95150dc9fd64307ee96b35657f75c7abd82530168ce3";
            string tx4Hash = "ceecfd37686a3ed1759d3cef25e412a800fc8e8846154dbe2a2d72b2af3e3b64";

            // First round of hash for tx1 and tx2
            string tx12 = tx1Hash + tx2Hash;
            string firstTx12 = GetHash(tx12);
            Console.WriteLine("firstTx12: " + firstTx12);

            // Second round of hash for final tx12 hash
            string tx12Hash = GetHash(firstTx12);
            Console.WriteLine("tx12Hash: " + tx12Hash);

            // First round of hash for tx3 and tx4
            string tx34 = tx3Hash + tx4Hash;
            string firstTx34 = GetHash(tx34);
            Console.WriteLine("firstTx34: " + firstTx34);

            // Second round of hash for final tx34 hash
            string tx34Hash = GetHash(firstTx34);
            Console.WriteLine("tx34Hash: " + tx34Hash);

            //First round of combining tx34 and tx12
            string tx1234 = tx12Hash + tx34Hash;
            string firstTx1234Hash = GetHash(tx1234);
            Console.WriteLine("firstTx1234Hash: " + firstTx1234Hash);

            // Second Round to get Merkle Root
            string merkleRoot = GetHash(firstTx1234Hash);

            Console.WriteLine("Merke root: " + merkleRoot);
        }

        static string GetHash(string textToHash)
        {
            byte[] stringbytes = Encoding.ASCII.GetBytes(textToHash);
            byte[] hashbytes = SHA256.Create().ComputeHash(stringbytes);
            string hexHash = BitConverter.ToString(hashbytes).Replace("-", "").ToLower();

            return hexHash;
        }

    }
}

using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace PlayMation
{
	// Token: 0x02000266 RID: 614
	public class Crypt
	{
		// Token: 0x060010A7 RID: 4263 RVA: 0x000766C4 File Offset: 0x000748C4
		public static string Encrypt(string plainText, string passPhrase)
		{
			byte[] bytes = Encoding.UTF8.GetBytes(plainText);
			string result;
			using (RijndaelManaged rijndaelManaged = new RijndaelManaged())
			{
				rijndaelManaged.Mode = 1;
				using (ICryptoTransform cryptoTransform = rijndaelManaged.CreateEncryptor(new Rfc2898DeriveBytes(passPhrase, Crypt.saltForDerivedB).GetBytes(32), Crypt.initVectorBytes))
				{
					using (MemoryStream memoryStream = new MemoryStream())
					{
						using (CryptoStream cryptoStream = new CryptoStream(memoryStream, cryptoTransform, 1))
						{
							cryptoStream.Write(bytes, 0, bytes.Length);
							cryptoStream.FlushFinalBlock();
							result = Convert.ToBase64String(memoryStream.ToArray());
						}
					}
				}
			}
			return result;
		}

		// Token: 0x060010A8 RID: 4264 RVA: 0x000767F0 File Offset: 0x000749F0
		public static string Decrypt(string cipherText, string passPhrase)
		{
			byte[] array = Convert.FromBase64String(cipherText);
			string @string;
			using (RijndaelManaged rijndaelManaged = new RijndaelManaged())
			{
				rijndaelManaged.Mode = 1;
				using (ICryptoTransform cryptoTransform = rijndaelManaged.CreateDecryptor(new Rfc2898DeriveBytes(passPhrase, Crypt.saltForDerivedB).GetBytes(32), Crypt.initVectorBytes))
				{
					using (MemoryStream memoryStream = new MemoryStream(array))
					{
						using (CryptoStream cryptoStream = new CryptoStream(memoryStream, cryptoTransform, 0))
						{
							byte[] array2 = new byte[array.Length];
							int num = cryptoStream.Read(array2, 0, array2.Length);
							@string = Encoding.UTF8.GetString(array2, 0, num);
						}
					}
				}
			}
			return @string;
		}

		// Token: 0x040010F6 RID: 4342
		private const int keysize = 256;

		// Token: 0x040010F7 RID: 4343
		private static readonly byte[] initVectorBytes = Encoding.ASCII.GetBytes("tu89geji340t89u2");

		// Token: 0x040010F8 RID: 4344
		private static readonly byte[] saltForDerivedB = Encoding.ASCII.GetBytes("5k9fdkd87'[-sdkj");
	}
}

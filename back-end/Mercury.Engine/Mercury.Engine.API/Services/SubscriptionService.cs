using System.Collections.Generic;
using System.Linq;
using Grpc.Core;
using Mercury.Engine.API.Models;
using Mercury.Engine.API.Services.GrpcGenerated;
using Mercury.Engine.API.Services.ServiceInterfaces;

namespace Mercury.Engine.API.Services
{
    public class SubscriptionService : ISubscriptionService
    {
        private ICollection<SubscriptionContainer> _subscriptionLegder;

        public ICollection<SubscriptionContainer> SubscriptionLedger
        {
            get
            {
                if (_subscriptionLegder is null)
                    _subscriptionLegder = new HashSet<SubscriptionContainer>();

                return _subscriptionLegder;
            }
            private set { }
        }

        public void Add(int userId, IAsyncStreamReader<SubscriptionRequest> request, IServerStreamWriter<SubscriptionReply> reply)
        {
            var sub = SubscriptionLedger.FirstOrDefault(z => z.UserId == userId);

            if (sub != null)
                sub = new SubscriptionContainer { UserId = userId, StreamReader = request, StreamWriter = reply };
            else
                _subscriptionLegder.Add(new SubscriptionContainer { UserId = userId, StreamReader = request, StreamWriter = reply });
        }

        public IServerStreamWriter<SubscriptionReply> GetStreamWriterByUserId(int userId)
            => SubscriptionLedger.FirstOrDefault(z => z.UserId == userId).StreamWriter;

        public IAsyncStreamReader<SubscriptionRequest> GetStreamReaderByUserId(int userId)
            => SubscriptionLedger.FirstOrDefault(z => z.UserId == userId).StreamReader;

        public SubscriptionContainer GetByUserId(int userId) => SubscriptionLedger.FirstOrDefault(z => z.UserId == userId);

        public IEnumerable<SubscriptionContainer> GetRangeByUserIds(IEnumerable<int> userIds) => SubscriptionLedger.Where(z => userIds.Contains(z.UserId));
    }
}

import SwiftUI

struct PaywallView: View {
    @EnvironmentObject var purchaseManager: PurchaseManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Theme.background.ignoresSafeArea()
                VStack(spacing: 24) {
                    Image(systemName: "person.2")
                        .font(.system(size: 64))
                        .foregroundStyle(Theme.accent)
                    Text("Loanledger Pro")
                        .font(Theme.titleFont)
                    Text("Repayment reminders and running per-person balance")
                        .font(Theme.bodyFont)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    Text("$1.99/month")
                        .font(Theme.headlineFont)
                    Button {
                        Task {
                            await purchaseManager.purchase()
                            dismiss()
                        }
                    } label: {
                        Text("Unlock Pro")
                            .font(Theme.headlineFont)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Theme.accent)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: Theme.cornerRadius))
                    }
                    .accessibilityIdentifier("unlockProButton")
                    .padding(.horizontal)
                    Button("Restore Purchases") {
                        Task { await purchaseManager.restore() }
                    }
                    .accessibilityIdentifier("restoreButtonPaywall")
                    Button("Not Now") { dismiss() }
                        .accessibilityIdentifier("dismissPaywallButton")
                        .foregroundStyle(.secondary)
                }
                .padding()
            }
        }
    }
}

#Preview {
    PaywallView().environmentObject(PurchaseManager())
}

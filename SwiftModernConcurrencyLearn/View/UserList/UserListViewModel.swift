
import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    
    @Published var userFiles: [URL] = []
    
    init () { getData() }
    
    func getData(){
        Task {
            do {
                userFiles = try await UserFilesRequest().perform().userFiles
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
